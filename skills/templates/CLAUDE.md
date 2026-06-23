# CLAUDE.md — [Venture Name]

> AI leads, humans govern.

This file is read by Claude Code at the start of every session. It provides full context for the current venture without requiring manual re-orientation. If Claude Code needs to ask what phase the venture is in, this file is incomplete.

---

## Studio context

**Playbook:** `../satsuma-ventures/studio/PLAYBOOK.md`
*(Absolute path from the studio repo sibling. Contains the operating model, stack, principles, and phase sequence.)*

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
| Design system | `DESIGN.md` | Populated at Phase 3 close |
| Spec | `spec.md` | Populated at Phase 4 sign-off |
| Signal brief | `signal-brief.md` | Populated at Phase 1 close |
| Thesis | `thesis.md` | Populated at Phase 2 close |
| Gate brief (T1) | `gate-brief-t1.md` | Populated at Phase 3 close |

*Artifacts marked "populated at" are placeholders until that phase is complete. Do not reference them before they exist.*

---

## Current phase skill

**Active skill:** `skills/[current-phase-skill].md`
*(Updated by venture.md at each phase transition. Replace with the path to the current phase skill before beginning work.)*

---

## Operating instructions

1. Read this file first, every session
2. Read `STATUS.md` to confirm current phase and any blockers
3. Load the active skill file listed above
4. Do not expand scope beyond what is signed off in `spec.md`
5. Do not make design decisions that contradict `DESIGN.md`
6. Surface conflicts and ambiguities before acting, not after
