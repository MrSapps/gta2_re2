#!/bin/bash
REPO=${REPO:-/home/user/gta2_re2}; TMPW=${TMPW:-/tmp/claude-0}; TOOLS=${TOOLS:-/tmp/claude-0/at}; mkdir -p $TMPW
# wipscan.sh [FILE.cpp...]: mnd diff counts of all WIP functions (WIP_IMPLEMENTED stripped) -> $TMPW/wipscan.txt
cd $REPO
files="$@"; [ -z "$files" ] && files=$(grep -l "WIP_FUNC(" Source/*.cpp | xargs -n1 basename)
for f in $files; do
  addrs=$(grep -oiE "^WIP_FUNC\(0x[0-9a-f]+\)" Source/$f | grep -oiE "0x[0-9a-f]+")
  [ -z "$addrs" ] && continue
  args=""; for a in $addrs; do args="$args $a:_$(printf %X $((a)))@"; done
  $TOOLS/w.sh $f $args 2>/dev/null | sed "s|^|$f |"
done
