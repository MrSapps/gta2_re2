# Near-miss worker tools (not for merging)

State for the near-miss WIP matching run on `claude/cool-sagan-3lbt60`, so it can restart on a fresh
container. `bootstrap.sh` rebuilds wine/VC6, the venv, the target-asm data, the baseline and the five
worktrees `/tmp/claude-0/wt/g1..g5` (branches `inl/gN`). `at/` holds the worker instructions (`NEAR.md`)
and helper scripts; `m/avail.txt` is the candidate list (addr name difflines ratio) and `m/assigned.txt`
the addresses already handed out.
