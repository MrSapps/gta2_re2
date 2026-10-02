#!/bin/bash
REPO=${REPO:-/home/user/gta2_re2}; TMPW=${TMPW:-/tmp/claude-0}; TOOLS=${TOOLS:-/tmp/claude-0/at}; mkdir -p $TMPW
# w.sh FILE.cpp ADDR[:NEEDLE]... : compile one TU (WIP_IMPLEMENTED/NOT_IMPLEMENTED stripped), print the
# mnd diff count per function (0 = asm equal ignoring stack offsets)
cd $REPO && export GTA2_RE=$REPO WINEDEBUG=-all
f=$1; shift
o=$TMPW/q.obj; rm -f $o
t=Source/_w_tmp_${f%.cpp}.cpp
sed -E 's/^\s*(WIP|NOT)_IMPLEMENTED;\s*$//' Source/$f > $t
sh 3rdParty/cpp_permuter/examples/gta2/compile.sh $t $o > $TMPW/q.log 2>&1; r=$?
rm -f $t
[ $r = 0 ] || { grep -i "error" $TMPW/q.log | head; exit 1; }
for x in "$@"; do a=${x%%:*}; n=${x#*:}; [ "$n" = "$x" ] && n=_$(printf "%X" $((a)))@; echo "$a $($TOOLS/mndc.sh $a $n 2>&1 | tail -1)"; done
