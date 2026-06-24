# Retrospective

**Track:** Any  
**Track Phase:** On-demand  
**Overall Phase:** On-demand  
**Tool:** Claude Code VS Code extension  
**Input:** The artifacts and context from the phase or decision being reviewed  
**Output:** A retrospective document committed to the venture's repo; for 1-way-door decisions, a completed adversarial review before the decision is confirmed
**Version:** 1.1  

---

## Playbook Context

Read the **Principles** section of `PLAYBOOK.md` before beginning. This skill can be invoked from any phase, at any gate, or independently whenever the founder wants to step back and reflect. It is referenced by other skills at 1-way-door decision points.

The principle most active in this skill:

- **Kill early, kill cleanly** — the purpose of a retrospective is not to justify a decision that has already been made. It is to ensure the decision is conscious, evidence-based, and durable. A retrospective that surfaces a reason to reverse course has done its job.

---

## When to invoke this skill

**Automatically — at 1-way-door decisions:**
The following decisions are difficult or impossible to reverse. Run this skill before confirming any of them:

- **Phase 3 gate — Commit:** Committing to Track 2 is a significant investment of time and focus. Run the adversarial review before committing.
- **Phase 7 — DNS transition:** Going live is public and largely irreversible in terms of user expectations. Confirm pre-launch readiness before flipping the switch.
- **Phase 8 gate — Kill, Pivot, or Graduate:** All three are consequential. Run the adversarial review against the recommendation before the founder confirms.
- **Track 4 — Spinout:** Graduating a venture into an independent entity is permanent. Reserved for when Track 4 is developed.

**On-demand — at any other point:**
- End of any phase, if the founder wants to capture what was learned before moving on
- After a difficult build or design session
- When something went unexpectedly well or badly and the learning is worth capturing
- Periodically during long beta periods
- Any time the founder wants to step back and think

---

## Modes

### Mode A — Lightweight gate retrospective

For on-demand use at the end of a phase, or when a quick reflection is all that's needed. Takes 5–10 minutes.

Ask the founder:
1. What worked well in this phase that we should carry forward?
2. What would we do differently if we ran this phase again?
3. Is there anything that should go into `BACKLOG.md` based on what emerged here?

Produce a brief entry for the venture's retrospective log (`retro-log.md`):

```markdown
## [Phase name] — [Date]

**What worked:** [1–3 sentences]
**What to improve:** [1–3 sentences]
**Backlog additions:** [Any items, or "none"]
```

---

### Mode B — Intensive retrospective

For major transitions: Kill, Pivot, Graduate, the end of a full iteration cycle, or any moment where the founder wants to think deeply before moving on.

**Step 1 — Reconstruct the timeline**
Briefly walk through the key decisions made during this phase or cycle: what was decided, when, and on what basis. Not a full audit — just enough to see the decision arc clearly.

**Step 2 — Evaluate outcomes against intent**
For each key decision:
- Did the outcome match the intent?
- If not, was that because the decision was wrong, or because circumstances changed?

**Step 3 — Extract learnings**
What does this experience reveal about:
- The venture specifically (what's true about this product and this market)
- The studio's operating model (what worked or didn't in the Satsuma process)
- The founder's judgment (patterns worth being aware of going forward)

Be specific. "We learned to validate sooner" is not a learning. "We learned that our target user already has a workaround they're satisfied with, which means the thesis requires a meaningfully better outcome to displace it" is a learning.

**Step 4 — Produce the retrospective document**

```markdown
## [Venture name] — [Phase/decision] Retrospective
*Date · [Phase or decision context]*

### Decision timeline
[Key decisions and their basis]

### Outcome evaluation
[What matched intent, what didn't, why]

### Learnings — Venture
[What this revealed about the product and market]

### Learnings — Studio
[What this revealed about the Satsuma process]

### Learnings — Founder
[Patterns worth being aware of]

### Next steps
[What happens next, specifically]
```

---

### Mode C — Adversarial review (for 1-way-door decisions)

This mode is embedded in Mode B but can also be run independently before any decision that is difficult to reverse.

**Purpose:** Surface the strongest possible case for the opposing decision before the founder confirms. Not to change the decision — to ensure it is conscious.

**Step 1 — State the proposed decision and the evidence supporting it**
[2–3 sentences summarising the recommendation and its basis]

**Step 2 — Argue the opposing case**
Claude argues the strongest case for the alternative(s). This is not a hedge or a balanced presentation — it is a committed argument for why the other decision is correct, using the same evidence.

For a proposed Graduate:
> *Argue for Kill or Iterate:* "The retention numbers are directionally positive but below target. Three of the five cohort users mentioned the same friction point without prompting. The thesis assumed users would [X], but the primary behaviour observed was [Y]. The case for graduating now is that Track 3 will surface this anyway — but the case for iterating first is that we know specifically what to fix, and fixing it before scaling avoids embedding a known problem into the growth phase."

For a proposed Kill:
> *Argue for Iterate or Pivot:* "Two cohort users showed strong engagement with a specific feature that wasn't the primary thesis. The Kill recommendation rests on the thesis failing — but the evidence may point to a pivot rather than a kill. The adjacent opportunity [X] was not tested and the data suggests it might have stronger signal."

**Step 3 — Engage with the adversarial argument**
The founder responds to the adversarial case. What does the founder think of it? Does it change the decision? If not, why not?

**Step 4 — Confirm or revise**
State the final decision and the reasoning, including why the adversarial case was considered and either accepted or rejected.

Document both the decision and the adversarial argument that was considered — this is the most valuable part of the record.

---

## Output

All retrospective output is committed to the venture's repo:

- **`retro-log.md`** — running log of all retrospectives (Mode A entries appended chronologically)
- **`retro-[phase]-[date].md`** — standalone document for intensive retrospectives (Mode B and Mode C)

For Kill decisions: also add a `BACKLOG.md` entry noting the venture was killed and linking to the retrospective document, so future sessions can find the reasoning.

---

## Guardrails

**Perspective:** The retrospective is not a validation exercise. Its job is to surface what is true, including things that are uncomfortable. A retrospective that concludes "everything was fine" after a difficult phase has not done its job.

**Adversarial review is not devil's advocate for its own sake.** The adversarial case should be the strongest honest argument for the other decision, not a contrarian exercise. If there is no strong opposing case, say so — but look hard first.

**Learnings must be specific.** Generic observations ("we should validate earlier") do not improve future decisions. Specific observations ("we validated the problem but not the willingness to change behaviour, which was the actual risk") do.

**The adversarial review is before the decision, not after.** Running an adversarial review post-decision is a rationalisation exercise, not a review. Invoke this skill before confirming 1-way-door decisions.

**This skill has no gate.** There is no output the founder must sign off on before proceeding. The value is in the thinking, not the document.
---

## Changelog

**v1.1** — Tool updated from Claude Chat to Claude Code VS Code extension.
**v1.0** — Initial skill. Three modes: Mode A (lightweight gate check), Mode B (intensive retrospective), Mode C (adversarial review for 1-way-door decisions).
