#!/bin/bash
REPO=${REPO:-/home/user/gta2_re2}; TMPW=${TMPW:-/tmp/claude-0}; TOOLS=${TOOLS:-/tmp/claude-0/at}; mkdir -p $TMPW
# vt.sh FILE.cpp...: compile each TU, list functions whose code differs from $TMPW/baseobj (with marker status)
cd $REPO && export GTA2_RE=$REPO WINEDEBUG=-all
for f in "$@"; do
  f=${f#Source/}
  ef=""; [ "$f" = "Network_20324.cpp" ] && ef="/Gz"
  EXTRA_CFLAGS="$ef" sh 3rdParty/cpp_permuter/examples/gta2/compile.sh Source/$f $TMPW/vt.obj > $TMPW/vt.log 2>&1 || { echo "$f: COMPILE ERROR"; grep -i error $TMPW/vt.log | head -5; continue; }
  venv/bin/python3 $TOOLS/objcmp.py $TMPW/baseobj/$f.obj $TMPW/vt.obj | while read k n; do
    a=$(echo "$n" | grep -oE '_[0-9A-F]{6}@' | head -1 | tr -d '_@')
    st=$(grep -rhoiE "^(MATCH|WIP|STUB)_FUNC\(0x$a\)" Source/*.cpp 2>/dev/null | head -1 | cut -d_ -f1)
    echo "$f: $k ${st:-?} $n"
  done
done
