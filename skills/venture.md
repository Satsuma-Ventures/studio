# Venture

**Scope:** Single venture  
**Tool:** Claude Code VS Code extension  
**Invoked:** At the start of any venture work session, or on-demand when asking "what's next?"  
**Reads:** This venture's `STATUS.md`, `BACKLOG.md`, `retro-log.md`, and relevant phase artifacts  
**References:** `PLAYBOOK.md`, shared phase skills in `skills/1-plant/` through `skills/4-harvest/`
**Version:** 1.4  

---

## Purpose

The venture-level navigator. Orients each session to where the venture currently is, determines what to work on next, routes to the appropriate phase skill, and maintains the venture's context files. Tunnel vision — no cross-venture awareness. That belongs to `satsuma.md`.

---

## How skills reach a venture repo

Skills are mastered in the studio repo (`satsuma-ventures/studio`). Each venture repo gets a copy:

- When a venture enters a new phase, copy the relevant skill files from the studio repo into the venture's `/skills/` directory alongside `PLAYBOOK.md`. Update `CLAUDE.md` in the venture repo to reference the new phase skill.
- The copy is deliberate — it locks in the version of the skill in use at that phase. If skills improve in the studio repo, the upgrade is a conscious pull decision, not automatic
- Per-venture context files (`STATUS.md`, `BACKLOG.md`, `retro-log.md`) remain in the studio repo under `skills/[venture]/` so `satsuma.md` can read across all ventures without crossing repos

When Claude Code is working inside a venture repo, it reads the local `/skills/` copies. When `satsuma.md` or `venture.md` runs from the studio repo context, it reads the master skills and all venture context files directly.

---

## Playbook Context

Read the **Principles**, **Stack**, and **Venture Lifecycle** sections of `PLAYBOOK.md` before beginning. The relevant phase skill provides the detailed operational guidance for each phase. This skill's job is orientation and routing, not execution.

---

## Behavior

### 1. Orient to current state

At the start of every session, read:
- `CLAUDE.md` — always first; it references all other context files
- `STATUS.md` — current phase, last gate, next gate, blocking issues
- `BACKLOG.md` — any high-priority items relevant to the current phase
- `DESIGN.md` — present once Phase 3 is complete; lives at repo root
- `artifacts/` — phase outputs; check what exists before starting any phase
- The most recent entry in `retro-log.md` (if it exists) — any learnings from the last phase or iteration

Produce a brief orientation for the founder:

> **[Venture name] — Session orientation**
> Current phase: [Phase N — Name]
> Last completed gate: [Gate name and date]
> Next gate: [What it is and roughly when]
> Open blockers: [Any, or "none"]
> Relevant backlog: [Any high-priority items that surface at this phase, or "none"]

Then ask: *What would you like to work on today?*

If the founder says "what should I work on?" — recommend the next action based on the current phase and STATUS.md, and route to the appropriate skill.

### 2. Route to the right phase skill

**Session management before routing**

Before loading the next skill, assess session state:

- **Within a phase** (resuming work): continue the current session. Run `/compact` if the conversation is long and context feels cluttered.
- **Phase transition within a track**: recommend running `/compact` to compress history, or starting a new session if the current one is heavy. Either is acceptable.
- **Track transition** (e.g. Track 1 → Track 2): always start a new session. The context requirements shift significantly between tracks. CLAUDE.md will re-orient Claude Code to the current state automatically.
- **Usage limit approaching**: start a new session proactively rather than hitting the limit mid-phase.

Based on current phase, **copy the skill from the studio repo before invoking it**:

```bash
# Example: transitioning to Phase 2
cp ../studio/skills/1-plant/2-thesis.md skills/1-plant/2-thesis.md
```

Then invoke the skill:

| Phase | Skill | Tool |
|---|---|---|
| 1 — Signal | `skills/1-plant/1-signal.md` | Claude Code VS Code extension |
| 2 — Thesis | `skills/1-plant/2-thesis.md` | Claude Code VS Code extension |
| 3 — Concept | `skills/1-plant/3-concept.md` | Claude Code VS Code extension |
| 4 — Spec | `skills/2-sprout/4-spec.md` | Claude Code VS Code extension |
| 5 — Design | `skills/2-sprout/5-design.md` | Claude Code VS Code extension |
| 6 — Build | `skills/2-sprout/6-build.md` | Claude Code VS Code extension |
| 7 — Ship | `skills/2-sprout/7-ship.md` | Human-led; Claude Code for synthesis |
| 8 — Learn | `skills/2-sprout/8-learn.md` | Claude Code VS Code extension |

If the founder wants to work on something that doesn't map to the current phase (e.g. updating the backlog, running a retro), route accordingly:
- Backlog review/prioritization → work through `BACKLOG.md` directly
- Retrospective → `skills/retro.md`
- Orientation / "where are we?" → handle in this skill, no routing needed

### 3. Maintain STATUS.md, CLAUDE.md, and DESIGN.md

Update `STATUS.md` whenever:
- A phase gate is completed
- A blocking issue is resolved or identified
- A significant decision is made
- The venture's stage changes

Update `CLAUDE.md` whenever:
- The venture advances to a new phase (update the current SKILL.md reference)
- A new artifact is committed (`DESIGN.md`, `artifacts/2-4-spec.md`)

`DESIGN.md` is maintained by Phase 3 and Phase 5 skills — lives at repo root, not in artifacts/. venture.md confirms its presence before routing to Phase 4 or later.

Check `artifacts/` at each phase start — if the current phase artifact already exists, read it and ask the founder whether to resume from it or regenerate. Never silently overwrite a signed-off artifact.

**STATUS.md format:**

```markdown
# [Venture Name] — Status
*Last updated: [date]*

**Stage:** [Planted / Sprouting / Ripening / Harvested]
**Current phase:** [N — Phase name]
**Phase started:** [date]
**Last gate completed:** [Phase N — Gate name] on [date]
**Next gate:** [What it is]
**Blocking issues:** [Description, or "None"]
**Open backlog items:** [Count] ([N] high priority)
**Rocks:** [Current quarterly Rock for this venture, or "None set"]
**Latest note:** [One sentence — what's happening right now]
```

### 4. Maintain BACKLOG.md

When new backlog items are identified during a session, append them using the standard format:

```markdown
## [Short title]

**Phase:** [Phase number and name that logged this]
**Source:** [Specific epic, story, or step]
**Category:** `deferred-v2` | `enhancement` | `bug-prevention` | `new-feature` | `tech-debt`
**Description:** [What was observed and why it might be worth pursuing]
**Priority:** `unset`
```

On request, review and prioritize the backlog against the current OKR. Update `Priority` values:
- `high` — directly serves the current OKR or a current Rock
- `medium` — relevant to the current stage but not immediately blocking
- `low` — worth keeping but not near-term
- `deferred` — genuinely out of scope for the current stage

### 5. Session close

At the end of each session, confirm:
- Has `STATUS.md` been updated if anything changed?
- Are any new backlog items logged?
- Is there anything to flag to `satsuma.md` for the next weekly brief?

---

## Guardrails

**Single-venture focus.** This skill has no visibility into other ventures. Cross-venture observations belong in `satsuma.md`.

**Orient before routing.** Always read STATUS.md before recommending what to work on. A recommendation made without reading current state may send the founder to the wrong phase.

**Maintain status files.** STATUS.md is only as useful as it is current. Update it at every meaningful change — don't defer to the end of a project cycle.

**Routing is not execution.** This skill points to the right phase skill; the phase skill runs the work. Don't conflate orientation with execution.
---

## Changelog

**v1.4** — Session management guidance formalised in routing section (within-phase, phase transition, track transition, usage limit); artifact check added to orient step.
**v1.3** — Routing table Phases 1–2 updated to Claude Code VS Code extension (removed claude.ai distinction); skill-copying instruction added to routing step.
**v1.2** — "How skills reach venture repo" section updated; DESIGN.md confirmed at repo root (not artifacts/); CLAUDE.md update triggers documented; routing table tool column added.
**v1.1** — CLAUDE.md added to maintenance list and routing; DESIGN.md added to per-venture artifact registry; tool routing table updated with Tool column; per-venture config block removed (STATUS.md handles venture context).
**v1.0** — Initial skill. Shared template: orients to venture state, routes to phase skill, maintains STATUS.md and BACKLOG.md.
