# CLAUDE.md — [Venture Name]

> AI leads, humans govern.

This file is read by Claude Code at the start of every session. It provides full context for the current venture without requiring manual re-orientation. If Claude Code needs to ask what phase the venture is in, this file is incomplete.

---

## Studio context

**Playbook:** `PLAYBOOK.md`
*(Local copy, version-locked at scaffold time. Contains the operating model, stack, principles, and phase sequence.)*

---

## Venture context

**Venture name:** [Venture Name]
**Repo:** satsuma-ventures/[venture-name]
**Status:** See `STATUS.md`

---

## Active artifacts

| Artifact | Path | Status |
|---|---|---|
| Status | `STATUS.md` | Always present |
| Backlog | `BACKLOG.md` | Always present |
| Design system | `DESIGN.md` | Populated at Phase 3 close — lives at repo root |
| Spec | `artifacts/2-4-spec.md` | Populated at Phase 4 sign-off |
| Signal brief | `artifacts/1-1-signal-brief.md` | Populated at Phase 1 close |
| Thesis | `artifacts/1-2-thesis.md` | Populated at Phase 2 close |
| Gate brief (T1) | `artifacts/1-3-gate-brief.md` | Populated at Phase 3 close |

*Artifacts marked "populated at" are placeholders until that phase is complete. Do not reference them before they exist.*

---

## Current phase skill

**Active skill:** `skills/[track-folder]/[skill-file].md`
*(Updated by venture.md at each phase transition. Current skill is copied from the studio repo into this venture's skills/ folder at phase start.)*

---

## File hierarchy and source of truth

These files have different authority levels. When they conflict, higher authority wins:

| Priority | Location | What it is |
|---|---|---|
| 1 — Signed-off artifacts | `artifacts/*.md` (no -WIP suffix) | Satsuma-validated source of truth for this venture. These are the outputs of the playbook process. |
| 2 — WIP artifacts | `artifacts/*-WIP.md` | In-progress phase work. Authoritative once complete. |
| 3 — Phase skills | `skills/` | Operating instructions for the current phase. |
| 4 — Context files | `context/` | Prior art, background research, and supporting materials the founder brought in. **Background color only — not conclusions.** Treat as hypotheses to validate against the Satsuma process, not as decisions already made. |

**Context files are inputs, not outputs.** Rich prior art in `context/` (business plans, positioning documents, competitive research) should inform the work but not replace it. The phase artifact is the deliverable; the context file is a starting point. When context files and phase artifacts conflict, the artifact is correct.

## Operating instructions

1. Read this file first, every session
2. Read `STATUS.md` to confirm current phase and any blockers
3. Load the active skill file listed above
4. Do not expand scope beyond what is signed off in `artifacts/2-4-spec.md`
5. Do not make design decisions that contradict `DESIGN.md`
6. Surface conflicts and ambiguities before acting, not after
