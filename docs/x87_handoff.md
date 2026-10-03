# x87 / MapRenderer handoff

Status of the MapRenderer x87 scheduling investigation, the tools built for it, and where to pick it up.
Read `docs/matching_quirks.md` ("x87 code: rounding points and kept values" and the MapRenderer entry
under "Still unexplained") for the details behind each point.

## Where it stands

- About 13 MapRenderer functions at 0.89 to 0.94 (`DrawDiagonal*Face_4ECAF0/4ECE40`, `Draw3Sided*`, `Draw4Sided*`,
  `draw_lid_4EE130`, `ProjectVert_4EB940`, ...) differ only in x87/integer instruction order around the
  inlined `ProjectVertTop_46BD40` / `ProjectVertBottom_46BDF0` / `ProjectVert_46BC70` helpers.
- Matched along the way: `Set_UV_4F4190` (f32 locals instead of `ToFloat()`), `Mike_A80::sub_4FFD90`
  (a repeated `630 - fx` that VC6 CSEs; a ternary clamp).

## What is known

1. **The compiler build is not the cause.** decomp.me's VC6 builds were compiled against the same TU:
   RTM, SP3, SP4 (ours, byte-identical: CL 8804, C1XX 8867, C2 8799), SP5 and SP6 give the same code for the
   cluster; the Processor Pack is worse. The 10.5 Rich header matches our objects (Utc12_CPP 8799/8797,
   Linker600 8447). The scheduler is deterministic and doesn't depend on TU-global counters.
2. **The schedule follows the expression tree.** Assigning to an `f32` local, or an `(f32)` cast of a
   product, adds a rounding node that moves the next x87 op later; a repeated float subexpression keeps a
   value on the x87 stack (`fsub %st(1),%st` ... `fstp %st(0)`). Commutative operand order and the spelling
   of the u32 conversion make no difference.
3. **The helper bodies are the original source, as 9.6f compiled them.** 9.6f.exe is VC7.0
   (Utc13 13.00.9466, VS.NET 2002), and decomp.me's msvc7.0 is that exact build. With
   `/O2 /Ob0 /G5 /GX` (/G3 /G4 the same; the default /GB and /G6 differ: they convert u32 with
   `test/jge/fadds 2^32` instead of `fildll`) our current `ProjectVertTop_46BD40`, `ProjectVertBottom_46BDF0`
   and `ProjectVert_46BC70` bodies give the 9.6f code exactly (ratio 1.000). The only changes needed were
   external linkage and `__stdcall`: VC7 gives static functions a custom register convention.
4. **In 9.6f the helpers are members of `Nanobotz`, called with the caller's `this`** (`mov %ebx,%ecx` before
   `call 0x46BD40`). `Nanobotz` is MapRenderer's 9.6f name (it also has `set_shading_lev`, `GetColour`,
   `TransformTriangleUVs`, `ClearDrawnTileCount`), so in 10.5 they're probably inline MapRenderer members.
   The out-of-line `MapRenderer::ProjectVertTop_4EAE00`/`Bottom_4EAEA0` (both matched) would then be
   copies VC6 didn't inline (see "Big functions run out of inline expansions").
5. The remaining cluster difference: in the y line of the inlined Top, the original issues the centre load
   and the dead zero high dword of the u32 -> float temp (`mov 0x74(%eax),%edx; mov %esi,0x1C(%esp)`) only
   after `fstps x; fildl y; fmuls; fmul`, ours right after the x `fiaddl`.
6. **The 9.6f call sites are settled.** Under VC7 (`/O2 /Ob0 /G5 /GX`), 9.6f `draw_lid` (0x470800, 10.5
   `draw_lid_4F4D60`) gives the original's code for all four projections with the plain member call
   `ProjectVertTop_4EAE00(gXCoord_6F63AC + unk1, gYCoord_6F63B8 + unk3, &gTileVerts_6F65A8[0])` on `this`
   (12 lines left, ratio 0.935, all in the GetTile/GetTexture/DrawTile tail). Its callees match exactly
   (ratio 1.000) as `static void __stdcall` functions with the 10.5 bodies: `sub_46BEA0` = `draw_4F3FB0`, and
   `Set_UV_46C0C0` = `Set_UV_4F4190` with `ToFloat()` in place of the f32 locals. VC7 gives such static
   functions its register convention (`eax` = flags; `ecx`, one push and `esi` = the index reference for Set_UV).
7. **`ProjectVert_4EB940` is a member too.** Every 10.5 call to 0x4EAE00, 0x4EAEA0 and 0x4EB940 is
   `mov %ebp,%ecx; call` (in 4EA390, 4EAF40, 4EBA60, 4ED290 and the gradient slopes), so all three are thiscall
   MapRenderer members. 4EB940 is now one (committed: -11 lines in its callers, no MATCH changes).
8. **`ProjectVert_4EB940` shows the y-line problem on its own** (11 lines, no inlined Top/Bottom around it), so
   it is the fastest testbed: compile the TU head plus only that function (about 1 s). In the original the
   y high-dword store comes after every pointer access in the y line (`fstps (%ecx)` for x, the fov, y and
   centre loads), right before the lo store, as if the temp could alias pointer memory. Ours hoists it to
   just after the x `fiaddl`. In the x line it comes after `xor %edx,%edx`, which waits on the `fildl (%edx)` of
   x (a register reuse), so the x line doesn't tell either way.
9. **Not the front end.** C1XX from RTM, SP3, SP5 and SP6 paired with our C2.DLL (8799) give byte-identical code
   for the cluster and 4EB940. Together with point 1, every VC6 compiler-side cause we can test is ruled out.

## Experiments and their scores

Scored with `score.py` over all 30 MapRenderer WIPs (differing lines, lower is better; base 1505):

| Change | Total | Notes |
|---|---|---|
| Top/Bottom/ProjectVert as members of another struct, called through a global instance | 1293 | 4EA390 -67, 4EAF40 -63, 4EBA60 -27, 4ED290 -55, nothing worse, cluster unchanged |
| local `Camera_0xBC*` in Top | 1411 | 4EAF40 -67, 4ED290 -60, 4EBA60 +32 |
| `(f32)(y * scale)` or an f32 local for the Top y product | 1417-1426 | cluster -12, 7 functions worse |
| inline MapRenderer members (`inline void MapRenderer::ProjectVertTop_46BD40`) | 1467 | 4EA390 -45, cluster +5 |
| static/extern/`__stdcall` inline free helpers, `__forceinline` | 1505 | no change |
| about 150 other helper and call-site forms (centre conversions, z local, atan2 argument temps, pointer forms) | >= 1505 for the cluster | |
| one inline member per helper (`inline` `ProjectVertTop_4EAE00`/`Bottom_4EAEA0` with every call through them, either Bottom body) | 1528 | 4EBA60 +32, cluster unchanged |
| per-line rounding sweep: plain, `(f32)(product)`, f32 local, centre first, for each of Top x/y and Bottom x/y (256 combos) | 1299 best | f32 local for Top y only (4EAF40 -94, 4ED290 -87, 4EBA60 +32); cluster -2 to -6 at most |
| code-free perturbations in 4ECE40 (unused locals, declaration placement) | no change | |
| 4EB940 testbed: x line {block tmp, plain, `(f32)` product, centre first} x y line {8 forms}, named/volatile centre local | 10 best (`(f32)` x product) | |
| 4EB940 testbed flags: /Oa /Ow /Op /Og- /Oy- /Os /G6 /Ob0 worse; /Oi- /Ot /G5 /Ob2 no change | | |

Only the 4EB940 member change is committed (scores above are against the old base of 1505; it is 1494 now).

## Tools (`Scripts/tu_harness/`)

```bash
Scripts/tu_harness/fetch_compilers.sh                 # once: VC6 RTM..SP6 and VC7.0 into build_vc6/compilers/
Scripts/tu_harness/tu.sh Source/MapRenderer.cpp 0x4ecaf0 0x4ece40   # ~3 s: preprocess + compile one TU, diff counts
venv/bin/python3 Scripts/tu_harness/diff.py build_vc6/tu_harness/q.obj 0x4ecaf0      # the diff itself
venv/bin/python3 Scripts/tu_harness/score.py Source/MapRenderer.cpp --save           # base for a TU
venv/bin/python3 Scripts/tu_harness/score.py /path/to/variant/MapRenderer.cpp       # total + deltas + broken MATCHes
Scripts/tu_harness/cl.sh -tc msvc6.5 file.cpp         # any single file with another compiler build
```

`tu.sh` takes a modified copy of a .cpp anywhere on disk (it is compiled as if it were in `Source/`), so a
script can write variants to a temp file and score them without touching the tree. `score.py` also lists
`MATCH_FUNC`s whose code changed against the saved base. Still confirm a find with a full `build.py` and
`compare_builds.py`, and edit headers only temporarily.

9.6f checks (target: `target_96f.json` from the `claude/target-asm` branch, fetched by `diff.py --96f`):

```bash
W=build_vc6/tu_harness
Scripts/tu_harness/tu.sh Source/MapRenderer.cpp                       # writes $W/q.cpp (preprocessed)
n=$(grep -n "^static inline void set_vert_xyz_relative_to_cam_inlined" $W/q.cpp | cut -d: -f1)
head -$((n-1)) $W/q.cpp | sed 's/^static inline void ProjectVert/inline void __stdcall ProjectVert/' > $W/h96.cpp
echo 'void __stdcall W1(Fix16& x, Fix16& y, Vert* p) { ProjectVertTop_46BD40(x, y, p); }' >> $W/h96.cpp
Scripts/tu_harness/cl.sh -tc msvc7.0 $W/h96.cpp /O2 /Ob0 /G5 /GX
venv/bin/python3 Scripts/tu_harness/diff.py $W/h96.obj 46bd40 --96f   # 0 differing lines
```

VC7 rejects things VC6 accepts (case labels that skip an initialisation: C2360/C2361), so whole-file VC7
builds fail; cut the TU before the first such function and append only what you test.
`target_96f.json` holds only the 9.6f functions paired with a 10.5 function (3818). For MapRenderer that is
0x470250 (`DrawRightSide_4EAF40`), 0x46D9A0 (`draw_bottom_4ED290`), 0x470800 (`draw_lid_4F4D60`), 0x46EE40,
0x46BEA0 and the helpers 0x46BBF0/0x46BC70/0x46BD40/0x46BDF0.

## Next steps

1. ~~Match a 9.6f Draw function under VC7~~: done for `draw_lid` apart from its tail (point 6). Recipe: cut the
   preprocessed TU (`$W/q.cpp` from `tu.sh`) before `static inline void ProjectVertTop_46BD40`, append
   `draw_4F3FB0` and `Set_UV_4F4190` renamed as `static void __stdcall` (ToFloat() bodies) and a `draw_lid_4F4D60`
   that calls `ProjectVertTop_4EAE00` and `GetColour_46B5E0`, then
   `cl.sh -tc msvc7.0 ... /O2 /Ob0 /G5 /GX` and `diff.py OBJ 470800 --96f --needle draw_lid_4F4D60`.
   The tail (gLidType loaded into `eax`, gtx and gSharp pointer loads after the pushes) is left. Worth doing
   0x470250 (`DrawRightSide`) and 0x46D9A0 (`draw_bottom`) the same way: they also show which calls 9.6f made.
2. **Work the y line in the 4EB940 testbed** rather than in the cluster: whatever makes its y high-dword store
   wait for the pointer accesses should carry over to the inlined Top/Bottom. Untested ideas: the original
   `set_vert_xyz_relative_to_cam` as an inline in the header (4EB940 inlines it, 4EAE00 calls it, which
   suggests definition order), its parameters by reference, and `Vert` or `Camera_0xBC` field types that VC6
   might treat as overlapping the temp.
3. Use the same 9.6f route for other inline helpers: any 9.6f callee listed in `docs/inlines_96f.md` can now be
   compiled with VC7 and checked exactly (`/O2 /Ob0 /G5 /GX`, external linkage, the right calling convention;
   `static __stdcall` when the 9.6f callee takes register arguments).
