#!/bin/bash
# Saves the current lists to the claude/near-miss-tools branch (run after assigning or collecting results).
set -e
T=/tmp/claude-0; X=$T/toolsrepo
cat $T/wt/g*.tmp/near_status.txt 2>/dev/null | grep -oiE '^0x[0-9a-f]+' | tr A-Z a-z | sort -u > $T/m/done_now.txt
sort -u $T/m/done_now.txt $X/m/done.txt 2>/dev/null > $T/m/done.txt || true
cp $T/m/{avail.txt,assigned.txt,done.txt} $X/m/ && cp $T/at/* $X/at/
cd $X && git add -A && { git diff --cached --quiet || git -c user.name=MrSapps -c user.email=MrSapps@users.noreply.github.com commit -q -m "Update near-miss lists

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>"; }
cd /home/user/gta2_re2 && git fetch -q $X claude/near-miss-tools:claude/near-miss-tools && git push -q origin claude/near-miss-tools
