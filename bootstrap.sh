#!/bin/bash
# Rebuilds the near-miss worker setup on a fresh container.
# Usage: bash bootstrap.sh   (from anywhere; takes ~15 min)
set -e
R=/home/user/gta2_re2; T=/tmp/claude-0; TB=claude/near-miss-tools; BR=claude/cool-sagan-3lbt60
export WINEDEBUG=-all
cd $R
git remote get-url upstream >/dev/null 2>&1 || git remote add upstream https://github.com/CriminalRETeam/gta2_re
git fetch -q origin $BR claude/target-asm $TB
git checkout -q $BR 2>/dev/null || git checkout -q -b $BR origin/$BR
git merge -q --ff-only origin/$BR || true
git submodule update --init --recursive
if ! command -v wine >/dev/null; then
  sudo dpkg --add-architecture i386 && sudo apt-get update -q
  sudo apt-get install -y -q wine64 wine32:i386 xvfb binutils-mingw-w64-i686
fi
[ -d venv ] || python3 -m venv venv
. venv/bin/activate && pip install -q -r requirements.txt
python3 vc6_setup.py
# tools and lists
mkdir -p $T && rm -rf $T/tools_x && mkdir $T/tools_x
git archive origin/$TB | tar -x -C $T/tools_x
mkdir -p $T/at $T/m && cp -n $T/tools_x/at/* $T/at/ && cp -n $T/tools_x/m/* $T/m/
cd Scripts/bin_comp
for f in target_asm target_data target_extra fingerprints target_96f; do git show origin/claude/target-asm:$f.json > $f.json; done
cp $T/m/match_96f.json .
cd $R
# main build + baseline
python3 build.py --ignore_no_match > $T/b.log 2>&1 || true
(cd Scripts/bin_comp && python3 msvc_dump_new_data.py >/dev/null && python3 compare_builds.py --save $T/baseline | tail -1)
# worktrees g1..g5 (inl/gN), with symlinks to the submodules, venv and json data
git worktree prune
mkdir -p $T/wt
for g in g1 g2 g3 g4 g5; do
  W=$T/wt/$g
  [ -d $W ] || git worktree add -q -f -B inl/$g $W $BR
  for s in GTA2Hax cpp_permuter gta2_re_compile_tools; do rm -rf $W/3rdParty/$s; ln -sfn $R/3rdParty/$s $W/3rdParty/$s; done
  for s in Detours Manual-DLL-Loader; do rm -rf $W/Source/3rdParty/$s; ln -sfn $R/Source/3rdParty/$s $W/Source/3rdParty/$s; done
  ln -sfn $R/venv $W/venv
  for f in fingerprints match_96f target_96f target_asm target_data target_extra; do ln -sfn $R/Scripts/bin_comp/$f.json $W/Scripts/bin_comp/$f.json; done
  mkdir -p $W.tmp && touch $W.tmp/near.txt $W.tmp/near_status.txt
done
echo "bootstrap done"
