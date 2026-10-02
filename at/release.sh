#!/bin/bash
# release.sh gN: put the unfinished functions of worktree gN's list back in the pool (after its worker stopped)
T=/tmp/claude-0; W=$T/wt/$1.tmp
awk '{print tolower($1)}' $W/near.txt | sort -u > $T/m/rl_list.txt
grep -oiE '^0x[0-9a-f]+' $W/near_status.txt | tr A-Z a-z | sort -u > $T/m/rl_done.txt
comm -23 $T/m/rl_list.txt $T/m/rl_done.txt > $T/m/rl_back.txt
sort -u $T/m/assigned.txt | comm -23 - $T/m/rl_back.txt > $T/m/assigned.new && mv $T/m/assigned.new $T/m/assigned.txt
echo "released $(wc -l < $T/m/rl_back.txt) from $1"
