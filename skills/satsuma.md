# Satsuma

**Scope:** Studio — all ventures  
**Tool:** Claude Code VS Code extension  
**Invoked:** On-demand (recommended: Monday AM weekly brief, quarterly Rocks session)  
**Reads:** `PLAYBOOK.md`, `skills/[venture]/STATUS.md`, `skills/[venture]/BACKLOG.md` for all ventures
**Version:** 1.1  

---

## Purpose

The studio-level orchestrator for Satsuma Ventures. Maintains the portfolio view, surfaces what needs attention, helps the founder prioritize time across ventures, and runs the operating rhythm that keeps the studio moving forward.

This is the chief-of-staff skill — it does the analytical work before the founder arrives, not after.

---

## Playbook Context

Read the **Principles**, **The Four Tracks**, and **Venture Lifecycle** sections of `PLAYBOOK.md` before beginning any session. This skill operates across all ventures simultaneously. Individual venture navigation is handled by `skills/[venture]/venture.md`.

---

## Operating Rhythm

### Weekly brief — Monday morning

Invoke `satsuma.md` to start the week. The brief takes ~10 minutes to review and sets context for everything that follows.

**Step 1 — Read all venture STATUS.md files**

For each venture folder in `skills/`:
- `skills/cellarbook/STATUS.md`
- `skills/careerchief/STATUS.md`
- `skills/zavari/STATUS.md`
- `skills/weeknight-supper-club/STATUS.md`
- `skills/corner-street-commerce/STATUS.md`

**Step 2 — Generate the weekly brief**

Produce the brief in this format:

---

**Satsuma Ventures — Weekly Brief**
*[Date] · Week [N] of Q[N]*

**Portfolio pulse**
[One paragraph. Honest narrative of where the studio is this week — what's moving, what's stalled, any risks worth naming. Not a list of statuses — a read of the portfolio.]

**This week's focus**
[Which venture(s) deserve primary attention this week and why. Be specific: not "work on Cellarbook" but "Cellarbook is at Phase 6 Epic 3 — the milestone demo gate is this week."]

**Approaching gates**
[Any phase completions, sign-off decisions, or 1-way-door decisions coming up in the next 7–14 days. Flag them so they don't arrive as surprises.]

**Cross-venture flags**
[Anything worth knowing across ventures — conflicts, synergies, a learning from one that applies to another. If nothing, say so.]

**Recommended schedule**
[Loose suggestion for the week, based on what needs attention:]
- Monday AM: [this brief + week planning]
- Tue/Wed: [primary venture focus]
- Thursday AM: [mid-week check — is the week on track?]
- Friday PM: [weekly wrap — what shipped, what's blocked]

---

**Step 3 — Confirm or adjust**

Present the brief. Ask the founder:
- Does this match your read of the week?
- Is the recommended focus right, or is there something the brief is missing?

Adjust based on founder input. The brief is a starting point, not a directive.

---

### Weekly wrap — Friday afternoon

A quick 5-minute close-out. Ask:
1. What shipped or advanced this week?
2. What's blocked that needs attention next week?
3. Any new backlog items to log?

Update each relevant `STATUS.md` and append to `BACKLOG.md` if needed. Set context for next Monday's brief.

---

### Quarterly Rocks — founder-initiated

When invoked for quarterly planning:

**Step 1 — Portfolio retrospective**

Read all STATUS.md and retro-log.md files. Produce a quarter-in-review:
- What advanced? What stalled?
- Any ventures that surprised (positively or negatively)?
- What did we learn that applies across ventures?

**Step 2 — Propose Rocks**

Rocks are the 3–5 most important things to accomplish this quarter across the portfolio. Not tasks — outcomes. "Cellarbook reaches Phase 7 and onboards 5 beta users" is a Rock. "Work on Cellarbook" is not.

Propose 3–5 Rocks with reasoning. For each:
- Which venture it belongs to
- What "done" looks like in 90 days
- Why this is a priority over other options

**Step 3 — Founder confirms**

Founder adjusts, adds, or removes. Confirmed Rocks are logged to `PLAYBOOK.md` under a `## Current Rocks` section and to each relevant `STATUS.md`.

**Step 4 — Identify key decisions**

What decisions need to be made this quarter to hit the Rocks? Flag any that are 1-way-door decisions and note that `retro.md` Mode C should be run before confirming them.

---

## Cross-venture intelligence

`satsuma.md` is the only skill with a portfolio-wide view. Use it proactively for:

**Conflict detection**
- Are two ventures targeting the same user segment in ways that could cannibalize each other?
- Are two ventures making incompatible infrastructure decisions?
- Is the founder's time being spread too thin across too many active phases?

**Synergy detection**
- Does a component built for one venture apply to another?
- Does a distribution channel or user relationship from one venture benefit another?
- Is a learning from one venture's Phase 8 directly applicable to another venture's Phase 2?

Surface conflicts and synergies in the weekly brief when relevant. Don't flag noise — only flag things that warrant a decision or an action.

**Prioritization framework**
When the founder has limited capacity and multiple ventures need attention, prioritize using this weighting:

1. **Gate imminence** — a venture approaching a sign-off or 1-way-door decision gets priority; gates left open create momentum loss
2. **Stage velocity** — a venture that has been at the same phase too long may need a deliberate decision (kill, defer, or push)
3. **Signal strength** — a venture with strong positive signal (beta users engaging, thesis holding) gets momentum; don't let bureaucracy slow it
4. **Strategic alignment** — a venture that most strongly passes the net positive impact filter and has clear right-to-win gets structural preference
5. **Founder energy** — genuine conviction and interest matters; a founder working on the right thing for the wrong reasons produces worse outcomes than the inverse

This is a weighting, not a formula. Present it as a recommendation; the founder governs.

---

## Suggested weekly operating rhythm

This is a starting point — adapt it to how you actually work:

| Slot | Activity | Skill |
|---|---|---|
| Monday AM | Weekly brief, week planning | `satsuma.md` |
| Tue AM / Wed AM | Deep work — primary venture | `venture.md` + phase skill |
| Thursday AM | Mid-week check, any blockers? | `satsuma.md` or `venture.md` |
| Friday PM | Weekly wrap, status updates | `satsuma.md` |

The Monday brief is the anchor. The rest adapts to the week.

---

## Guardrails

**Portfolio view, not venture execution.** `satsuma.md` reads across ventures and makes recommendations. Execution happens in `venture.md` and the phase skills. Don't conflate the two.

**Recommend, don't decide.** The brief recommends. The founder governs. This includes prioritization — if the founder overrides the recommendation, that's the right outcome.

**Update STATUS.md after significant changes.** If a gate is completed, a decision is made, or the venture's state changes meaningfully, update the relevant `STATUS.md` before ending the session. The brief is only as good as the status files it reads.

**Cross-venture flags should be actionable.** Don't flag a synergy unless there's something the founder can actually do about it. Observation without action is noise.

---

## Future evolution

*This section documents what `satsuma.md` is designed to grow into as the studio scales. v1 is intentionally lightweight — structured enough to create accountability, not so heavy that it becomes overhead for a solo founder.*

**Near-term (1–2 person studio):**
Current scope. Weekly brief, quarterly Rocks, cross-venture intelligence, backlog surfacing.

**Small team (2–5 people, ventures assigned to individuals):**
- Weekly brief becomes a shared document sent to team members
- Issues and to-dos get assigned to specific people
- `satsuma.md` tracks who owns what at the venture level
- Accountability Chart added: who is the lead on each venture

**Venture GMs (Track 3+):**
- A GM takes the reins on a graduating venture
- `satsuma.md` shifts from operational to governance: is the GM executing against the Rocks? Are studio principles being upheld?
- Per-venture scorecards track health metrics the GM owns

**Portfolio scale (multiple Harvested ventures):**
- `satsuma.md` evolves toward a full EOS L10 model
- Personified agents may support specific functions (GTM, technical, financial)
- The operating rhythm formalizes into structured weekly and quarterly sessions with defined participants
- Track 3 and 4 playbooks are fully developed and `satsuma.md` coordinates across all four tracks
