# Adding the 9.6f inlines (worker instructions)

Project: GTA2 matching decompilation (C++ that MSVC 6 compiles to the same bytes as the
original 10.5.exe). Read `$REPO/CLAUDE.md` and `$REPO/docs/matching_quirks.md` first (skim the
latter), and the top of `$REPO/docs/inlines_96f.md` (method).

9.6f.exe is an older build of the game, made with a different compiler that mostly did not
inline. Many helpers that 10.5 inlined are real functions there. For each function in your todo
list, the 9.6f version calls functions ("missing: ...") that the 10.5 version doesn't call: those
are inlines. Our source open-codes them (raw field access, a repeated expression, ...). Your job:
**make our source use the inline helper instead**, adding the helper to the class header if it
doesn't exist, without breaking anything.

## Environment

Your own git worktree and temp dir (set these in every shell command; the shell doesn't keep them):

    export REPO=<worktree> TMPW=<worktree>.tmp TOOLS=/tmp/claude-0/at

Never touch /home/user/gta2_re2 (the main checkout) or another worktree.

Your todo list: `$TMPW/todo.txt`, one line per function:
`10.5addr STATUS file name | 9.6f addr | missing: 9.6f callees not called in 10.5`.
Work on the WIP lines first, then the MATCH lines.

## Tools (all in $TOOLS)

- `python3 $TOOLS/iv.py ADDR` shows the 9.6f asm of the function, with every call annotated: the 9.6f
  name, its 10.5 partner if any, and whether 10.5 calls it. Inlined callees are marked `<<INLINE`.
  It also prints each inlined callee's 9.6f body (up to 80 bytes, `iv.py ADDR 400` for bigger
  ones) and any `Source/` lines already noted with that 9.6f address. `iv.py ADDR -n` leaves out
  the caller's asm.
- `python3 $TOOLS/a96.py ADDR...` prints the 9.6f asm of any 9.6f function, for example a callee of
  an inline.
- `python3 $TOOLS/src.py ADDR` prints our source of the function, with line numbers.
- `$TOOLS/w.sh FILE.cpp ADDR...` compiles one .cpp (about 1s) and prints, for each WIP function, the
  number of asm lines that differ from the original 10.5 code (0 = equal apart from stack offsets).
  **Lower is better.** Use it before and after each change to a WIP.
- `$TOOLS/vt.sh FILE.cpp...` compiles each file and lists every function whose code changed against
  the build at the start (`DIFF MATCH ...`, `DIFF WIP ...`). A `DIFF MATCH` line means you broke a
  matching function: undo that change. After a **header** change, run `$TOOLS/vtall.sh` (all files,
  about 2 to 4 minutes: give the Bash call a 600000 ms timeout), since a header is included by many .cpp files.
- `git -C $REPO show HEAD:Source/X.hpp` and similar commands show the code as it was at the start.

## How to do one function

1. `iv.py ADDR`, then `src.py ADDR`. For each missing callee, read its 9.6f body and find where our
   source open-codes it. Use the order of the calls in the 9.6f asm.
2. If a helper with the same body already exists in the class (search the headers; the
   `noted:` lines help), use it, and add a `// 9.6f 0xADDR` comment above it if its name doesn't
   end with the address. Otherwise add an inline method to the class header:

       // 9.6f 0x4215B0
       inline bool IsDespawning_4215B0()
       {
           return field_88_despawn_status == 5;
       }

   Name it after what it does, ending in the **9.6f address** (or the 10.5 address when 10.5
   also has an out-of-line copy). Use the field's declared type (`s32`, `u8`, `Fix16`, ...).
   Follow the 9.6f body exactly: by value vs by reference, return a copy vs a reference, `u8`
   vs `s32`. Those differences change the code.
3. Replace the open-coded form in the function with the helper call.
4. Verify:
   - MATCH function: `vt.sh FILE.cpp` (`vtall.sh` after a header change) must not list
     `DIFF MATCH` for anything. If the inline changes a matching function's code, revert it and
     instead leave a comment where it would go, for example
     `// 9.6f: Car_BC::IsDespawning_4215B0 (inlined, using it changes the code)`.
   - WIP function: `w.sh FILE.cpp ADDR` must not be higher than before. If it is higher, revert and
     leave the same kind of comment. If it reaches **0**, say so in your status line (candidate
     match). Don't promote it yourself: the main session verifies with a full build.
5. Commit, one commit per function: `git -C $REPO add <the files you changed>` (never
   `git add -A` or `.`; the 3rdParty symlinks show up as changes and must not be committed),
   then commit with the subject `Use the 9.6f inlines in <Function name>` (or
   `Note the 9.6f inlines in ...` for comments only), a short body, and the last line
   `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`. Don't push and don't create branches.
6. Append one status line to `$TMPW/status.txt`:
   `0xADDR | <status> | <short note>`. Status is one of:
   - `done`: all missing inlines now used (or were false positives, see below).
   - `inlines added`: some used, others commented or left out, as the note explains.
   - `commented`: comments only (using them made the code worse or broke a match).
   - `checked`: nothing to add, for example a pairing error or only Fix16 operators.
   Add `CANDIDATE MATCH` to the note when a WIP reached 0.

## Rules and hints

- Only edit the .cpp files in your todo list, plus headers for new or noted helpers. Keep
  header edits minimal: add methods or comments, never change existing ones (other files use them).
  Never change struct layouts or field types.
- Some "missing" entries are noise:
  - The 10.5 function calls a different but equivalent function (the pairing isn't perfect).
  - Fix16/Ang16/Fix16_Point arithmetic helpers (9.6f `0x401xxx` to `0x40Fxxx`, short bodies that
    call `0x401Bxx`/`0x401Dxx`) are usually our existing operators. Check `fix16.hpp`, `ang16.hpp`
    and `Fix16_Point.hpp` for a method with the same body and use it where the source spells it out.
  - Big callees (hundreds of bytes) that 10.5 inlined are often already a separate inline
    function in our source, or worth adding as an inline function when the source has the body
    open-coded.
  Note such cases in the status line rather than forcing a change.
- Don't use `goto`. Don't reformat code. Don't touch docs/ or Scripts/.
- If a change won't compile, read the error (`cat $TMPW/q.log` or `$TMPW/vt.log`).
- Work steadily through the whole list. Keep notes short. If you run low on context, finish and
  commit the current function, write its status line, and stop.
- At the end, reply with a short summary: how many functions you did, candidate matches, and
  anything the main session should know (helpers that changed matching code, and so on).

**Never run a bare `git stash`, `git checkout .`, `git clean` or `git reset --hard`**: they wipe
the 3rdParty symlinks your worktree needs. To get "before" numbers, use
`git -C $REPO stash push -- Source/X.cpp` (specific paths only) and `git -C $REPO stash pop`, or copy
the file aside and back.
