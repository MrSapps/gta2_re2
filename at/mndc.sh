#!/bin/bash
REPO=${REPO:-/home/user/gta2_re2}; TMPW=${TMPW:-/tmp/claude-0}; TOOLS=${TOOLS:-/tmp/claude-0/at}; mkdir -p $TMPW
# mndc.sh ADDR NEEDLE: count of differing lines (mnd, stack offsets ignored) for $TMPW/q.obj
cd $REPO/Scripts/bin_comp && ../../venv/bin/python3 $TOOLS/mnd.py $TMPW/q.obj $1 $2 | grep -E "^  [-+]" | grep -vc nop
