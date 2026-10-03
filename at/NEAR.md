# Matching near-miss WIP functions (worker instructions)

Project: GTA2 matching decompilation (C++ that MSVC 6 compiles to the same bytes as the original
10.5.exe). Read `$REPO/CLAUDE.md` first, then skim `$REPO/docs/matching_quirks.md` (the VC6 codegen
patterns found so far; most near misses are one of them) and grep `$REPO/docs/match_attempts.md`
for your function's address before starting on it (earlier attempts, what didn't work).

Your worktree and temp dir (set them in every shell command, the shell doesn't keep them):

    export REPO=<worktree> TMPW=<worktree>.tmp TOOLS=/tmp/claude-0/at WINEDEBUG=-all

Never touch /home/user/gta2_re2 (the main checkout) or another worktree.

Your list: `$TMPW/near.txt`, one line per function: `addr name difflines ratio`, closest first.
Each function is a WIP_FUNC whose build asm is a few lines away from the original.

## Setup (once)

    cd $REPO && . venv/bin/activate
    python3 build.py --ignore_no_match > $TMPW/b.log 2>&1        # full build, 1 to 3 min
    cd Scripts/bin_comp && python3 msvc_dump_new_data.py > /dev/null && python3 compare_builds.py --save $TMPW/baseline

## Loop for one function

1. Remove its `WIP_IMPLEMENTED;` line (it adds code), and look at the diff:
   `cd $REPO/Scripts/bin_comp && python3 compare_target_asm.py ADDR` (unified diff, original `-`, build `+`),
   `--raw ADDR` for side by side, `--target ADDR` for the original only. Use lowercase hex without 0x.
   `python3 $TOOLS/src.py ADDR` prints our source, and `python3 $TOOLS/iv.py ADDR -n` the 9.6f version's
   inlined callees (9.6f is an older build with inlining mostly off, useful for missing inline helpers).
   **Always check the inlines first**: run `iv.py ADDR -n` and grep `$REPO/docs/inlines_96f.md` for the
   address. A 9.6f callee without a ✓ is a helper 10.5 inlines that our source may still lack; add it
   as an inline method (named after its 9.6f address, body from the 9.6f asm) and call it. If adding it
   makes the diff worse, leave a `// 9.6f inlined: sub_XXXXXX` comment where it belongs instead.
   Mention any inline you added or commented in the status note.
2. Change the source. Rebuild: `cd $REPO && python3 build.py --ignore_no_match > $TMPW/b.log 2>&1;
   grep -E ' error ' $TMPW/b.log | head` (incremental, under a minute; give Bash a 600000 ms timeout), then
   `cd Scripts/bin_comp && python3 msvc_dump_new_data.py > /dev/null && python3 compare_target_asm.py ADDR`.
3. When it prints `MATCH`: change `WIP_FUNC` to `MATCH_FUNC`, rebuild, and run
   `python3 compare_builds.py $TMPW/baseline`: it must show `changed: 0` (your function shows as
   `NEWLY MARKED MATCH`). Then commit (below) and re-save the baseline (`compare_builds.py --save $TMPW/baseline`).
4. If it doesn't match after a fair try (say 10 to 15 rebuilds, or you're sure what's left is a known
   unexplained quirk), restore `WIP_IMPLEMENTED;`, keep any source change only if it made the diff
   smaller and `compare_builds` still shows `changed: 0`, and move on.

Things that often fix near misses (details and examples in matching_quirks.md): wrong field/param
types (signedness, u8 vs s32, by value vs by reference), a missing inline helper (9.6f), branch order /
if-else vs early return, a local vs a repeated expression, declaration order of locals, a `switch`
instead of an `if` chain, struct copies vs field copies. Register swaps are often decided by the
order in which values are first computed. Don't use `goto` unless the original clearly has a shared
block several paths jump to (comment why).

Rules:
- Never break a MATCH_FUNC: `compare_builds.py $TMPW/baseline` must show `changed: 0` before each commit.
  Shared header changes affect many files, so check this after every header edit.
- Don't change struct layouts unless the asm proves the layout wrong and the other users still make
  sense; check compare_builds afterwards.
- Commits: one per function. `git -C $REPO add <the files you changed>` (never `git add -A` or `.`;
  the 3rdParty symlinks show up as changes and must never be committed). Subject `Match <Class::Name>`
  (or `<Name>: <what changed>` for an improvement that doesn't match yet), a short body saying what
  made it match, and the last line `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`.
  Don't push and don't create branches.
- **Never run a bare `git stash`, `git checkout .`, `git clean` or `git reset --hard`**: they wipe the
  3rdParty symlinks. Use path-limited commands (`git -C $REPO checkout -- Source/X.cpp`).
- Append one line per function to `$TMPW/near_status.txt`: `0xADDR | MATCH / closer N->M / no change | short note`.
  If you found a new codegen pattern, say so in the note (the main session adds it to the docs).
- Don't touch docs/ or Scripts/.
- **Context budget (the 5-hour usage window is shared by 5 workers, and every tool call re-reads your
  whole context, so a long context is the main cost).**
  - Pipe long output through `| head -40` / `| tail -20`; `compare_target_asm` diffs: `| head -60` at most,
    and prefer a one-line ratio (`| tail -2`) while iterating. Never `cat` whole files or whole asm dumps;
    use `src.py`, `grep -n` or `sed -n` ranges, and don't re-read what you already have.
  - Keep notes for the current function in `$TMPW/notes_<addr>.txt` instead of restating them in replies.
  - Cap each function at about 15 build/compare iterations by hand. If it isn't converging, run the
    permuter (below), take its best result if it helps, write the status line and move on.
  - Your context compacts automatically when it gets long, but a compaction loses detail: finish and
    commit (or revert) each function before starting the next, so nothing depends on old context.
  - If you notice you are well past half your context, finish the current function and stop early;
    a fresh worker continues the list.
- **Use the permuter for "right logic, wrong shape"** (see `docs/permuter.md`). It runs for minutes on
  CPU but costs almost no tokens, so prefer it over long manual permutation loops: once the calls,
  branches and logic match and only register choice, block order, case order or operand order differ,
  run it. Remove `WIP_IMPLEMENTED`/`NOT_IMPLEMENTED` first. 5 workers share 4 cores, so use `-j 2`:
  `cd $REPO && timeout 900 Scripts/permute.sh Source/X.cpp Class::Name_ADDR addr -j 2 -n 600 > $TMPW/perm.log 2>&1; tail -5 $TMPW/perm.log; ls permuter_out | sort -t- -k2 -n | head -3`
  (run it with run_in_background if your Bash supports it, and work on reading the next function meanwhile).
  Look at the best `permuter_out/output-<score>-*/diff.txt`, apply it by hand, then verify with the real
  build + `compare_target_asm` (the permuter score can drop while the real ratio gets worse; reject casts
  that make a compare always true/false). Delete `permuter_out` afterwards (never commit it).
- Work through the list in order (lists are 8 functions, so the context stays small).
- At the end, reply with a short summary: matches, improvements, new patterns found.
