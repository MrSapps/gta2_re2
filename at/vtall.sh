#!/bin/bash
REPO=${REPO:-/home/user/gta2_re2}; TMPW=${TMPW:-/tmp/claude-0}; TOOLS=${TOOLS:-/tmp/claude-0/at}
# vtall.sh: vt.sh over every Source/*.cpp (use after a header change); prints only differences
cd $REPO && $TOOLS/vt.sh $(ls Source/*.cpp | grep -v _w_tmp_ | xargs -n1 basename)
