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
10. **`set_vert_xyz_relative_to_cam_4EAD90` is an inline function** (committed). Its body is the 9.6f source
   (VC7 gives `sub_46BBF0` exactly). Defined `inline` at its own position, VC6 inlines it into
   `ProjectVert_4EB940` and keeps the calls in `ProjectVertTop/Bottom` and their inlined copies, as 10.5 does: the
   implicit `s32` -> `Fix16` conversion of their z argument blocks the inline (a named `Fix16` or a `Fix16&` z
   inlines). The code is identical to the old duplicate `set_vert_xyz_relative_to_cam_inlined` copy, so this
   doesn't change the y line. In the 4EB940 testbed, `inline`, `static inline`, `__forceinline`, cdecl and the
   definition order relative to an inline Top member all give the same 11 lines; reference parameters are worse
   (47/63).
11. **Field types don't matter either.** In the 4EB940 testbed (TU head patched per variant), all give the same
   11 lines: centre fields `u32` (with and without the casts), in an `s32`/`u32` array or `{x, y}` struct, in a
   union with an `f32`; `Vert` with `f32`, `u32` diff/spec, an `xyz[3]` or `f[8]` array, `x`/`y` in unions with
   `s32`, `w` as `DWORD`. So the y-line store isn't steered by alias classes from types.
12. **Y-line statement shapes don't either.** 60 shapes of the 4EB940 y line, each with four product orders
   (`y*fov*z`, `(f32)(y*fov)*z`, `fov*y*z`, `z*(y*fov)`): the centre in a block-local, function-level or
   assigned-before-y local (`u32`, `s32`, `f32`), one `tmp` shared with the x line, both centres loaded up
   front, the centre loaded before the x block, an f32 product local, an f32 fov local, and
   `y = product; y += centre`. Best is 11 (no change); none moves the high-dword store after `fstps (%ecx)`
   except the compound form, which only does so because it adds a `fsts 4(%ecx)` store and a camera reload
   (16-18 lines).
13. **The z line moves the y-line store.** `f32 inv_z = 1.0f / (...); pVert->z = inv_z;` (x and y still use
   `pVert->z`) or an f32 local for `zpos.ToFloat()` puts the 4EB940 y high-dword store exactly where the
   original has it (after `fstps (%ecx)` and the y loads): 11 -> 10 lines, committed for 4EB940. So the store
   position comes from rounding nodes *earlier* in the function, not from the y line itself. What's left in
   4EB940 is the centre load and its lo store (`mov 0x74(%eax),%eax; mov %eax,0x10(%esp)`), which ours now
   issues right after `fildl 0x60(%eax)` instead of after the y `fildl/fmuls`, and the first two lines (the
   `mov %ecx,%eax` in the inlined set_vert). Rerunning the 60 y-line shapes on top of either z form doesn't get
   below 10. Other z forms (order, `(f32)` casts, double `1.0`, `inv_z` used directly in x/y, z before set_vert,
   copies of the args) are no better. Applying `inv_z` to the inlined `ProjectVert_46BC70` too gives 1366 in
   total but with the usual inline-budget side effects (4EAF40 -91, 4EBA60 +32, 4F0420 +15), so it isn't
   committed.
   With `inv_z` the x line no longer needs the `{ u32 tmp = centre; ... }` block (the plain line is byte
   identical, committed), and x-line rounding forms (`(f32)` product, f32 product or x locals) don't delay
   the y centre load either (10, or worse).
14. **Rounding nodes in the inlined Top/Bottom trade one part of the cluster against another.** Sweep over the
   18 cluster functions (321 lines at base): per line of each helper, plain / f32 result local / f32 local for
   the vertex `ToFloat()` / `(f32)` product / f32 product local / f32 scale local, and plain or f32-local z (72
   forms per helper, then the best Top with all 72 Bottoms). Best: Top with an f32 local for the y product and
   for z, Bottom with `(f32)` on both products: cluster 277 (Draw3/4Sided 4EEAF0 20->8, 4EF1C0 24->10, 4F0030
   22->8, 4EFB20 22->10; draw_lid_4F4D60 -9), but draw_left/right/top/bottom (4F3C00, 4F4250, 4F4600, 4F49B0)
   +10 each and 4ECE40 +3; the TU total stays at 1493 (other forms that help the cluster raise it to 1538).
   Nothing reaches 0, so nothing is committed. What's left in the improved functions is the 4EB940 pattern:
   the y centre load (`mov 0x74(%eax),%edx`) and its lo store issued right after `fildl y` instead of after
   the y `fmuls`. The Draw3/4Sided-vs-draw_left split suggests the two groups may not inline the same helper
   bodies in the original (draw_left/right/top/bottom are the later `Fix16&`-parameter functions at
   0x4F3C00-0x4F49B0); unverified.
15. **Redundant parentheses and casts change the schedule.** A 2-hour cpp_permuter run on 4EB940 (58,713
   compiles, `Scripts/permute.sh`, random mode, 3 workers) took it from 10 to 4 lines (`diff.py`; permuter
   score 20 -> 8): the y line now matches. The winning source is semantically the same as ours:
   `f32 tmp = (((f32)(((f32)((f32)(1.0f / (...)))))));`, `((xpos.ToFloat() * fov) * pVert->z)` in the x line,
   and the y centre in a `u32` local before the y line. Bisecting: `((x * fov) * z)` alone, which parses the
   same as `x * fov * z`, gives 10 -> 7; dropping the equally redundant parentheses already in the y line
   goes back to 10; 0-3 levels of extra parentheses round the inverse depth give 7, 4 levels give 6, two or
   more `(f32)` casts give 7, the permuter's exact mix gives 4. So VC6's scheduler tie-breaks depend on the
   expression tree as written (parentheses and no-op casts included), which would explain why the original
   looks inconsistent from site to site. Practical consequence: hand-written variants can't cover this
   space; the permuter can. The original may also have used macros (which expand to nested parentheses and
   casts) where our source uses plain expressions.
   Left in the 4-line candidate: `mov %ecx,%eax` one slot late in the inlined set_vert, and `pop %ebx`
   before the last `fmuls 8(%ecx)` instead of after. A second run from that candidate, with set_vert also
   permuted, was started; candidates from run 1 are not committed (the casts are only acceptable for a match).
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
   wait for the pointer accesses should carry over to the inlined Top/Bottom. The set_vert definition order
   is settled (point 10); field types (point 11) and y-line statement shapes (point 12) are ruled out, and
   rounding nodes earlier in the function move the high-dword store (points 13, 14). The common remaining
   problem, in 4EB940 and the improved cluster functions alike, is the y centre load issued one FP op too
   early. Find what makes the original's centre load wait for the y `fmuls`; 4EB940 (10 lines) is still the
   quickest place to look. Separately, check whether draw_left/right/top/bottom use different helper bodies
   from Draw3/4Sided (point 14).
3. Use the same 9.6f route for other inline helpers: any 9.6f callee listed in `docs/inlines_96f.md` can now be
   compiled with VC7 and checked exactly (`/O2 /Ob0 /G5 /GX`, external linkage, the right calling convention;
   `static __stdcall` when the 9.6f callee takes register arguments).
