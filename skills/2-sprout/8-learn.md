# Learn

**Track:** 2 — Sprout the Idea  
**Track Phase:** 5 of 5  
**Overall Phase:** 8  
**Tool:** Claude Code VS Code extension (synthesis, recommendation, Amplitude MCP queries); human judgment at the gate  
**Input:** 30-day success framework and `beta-feedback-log.md` from `2-sprout/7-ship.md`, BugDrop issues labeled `beta-feedback`, Amplitude dashboard, direct cohort conversation notes  
**Output:** A documented decision — Iterate, Pivot, Graduate, or Kill — with evidence and next steps
**Version:** 1.2  
**Compatible with:** 7-ship v1.0+  

---

## Playbook Context

Read the **Principles** and **Venture Lifecycle** sections of `PLAYBOOK.md` before beginning this phase. This skill consumes the beta evidence gathered in Phase 7 and produces the decision that determines where the venture goes next.

The principles most active in this phase:

- **Kill early, kill cleanly** — a Kill decision at Phase 8 is not a failure; it is the playbook working correctly. A clean kill frees capacity for something better and produces institutional memory that improves the next venture.
- **Value created, not just captured** — Phase 8 is the first time real data can answer whether the product creates genuine value beyond the transaction. This is not a secondary question; it is part of the thesis evaluation.
- **AI leads, humans govern** — Claude synthesises all signal sources and produces a structured recommendation. The founder makes the decision. The AI does not choose the outcome.

---

## Purpose

Evaluate the beta evidence against the thesis. Determine whether the core assumption from Phase 2 held up under real-world contact with users. Produce a clear, evidence-based recommendation and a documented decision that either closes Track 2 cleanly or defines what comes next.

---

## Behavior

### 1. Orient to Phase 7 artifacts

Before synthesising anything, confirm all evidence sources are available:

- `beta-feedback-log.md` — the weekly synthesis log from Phase 7
- BugDrop issues in the repo labeled `beta-feedback`
- Amplitude dashboard access (use the Amplitude MCP if configured to query data directly)
- Founder's notes from day 7 and day 30 cohort check-in conversations

Also retrieve from earlier phases:
- The Signal Brief (`1-plant/1-signal.md` output) — specifically the Key Assumption
- The Thesis Document (`1-plant/2-thesis.md` output) — specifically the thesis statement and top three risks
- The OKR and 30-day success framework from `2-sprout/4-spec.md` and `2-sprout/7-ship.md`

If any of these are missing, ask the founder to provide them before proceeding.

### 2. Quantitative evaluation

Evaluate the Amplitude data against the 30-day targets from the Phase 7 success framework. Use the Amplitude MCP to query data directly where configured; otherwise, ask the founder to share the relevant Amplitude dashboard views.

For each Key Result:

| Key Result | 30-day target | Actual | Status |
|---|---|---|---|
| [KR] | [target] | [actual from Amplitude] | On track / Below target / Above target |

Go deeper on the signals that matter most:
- **Retention** — are users returning? What does the 7-day and 14-day retention curve look like for the cohort?
- **Core action completion** — are users reaching the primary value moment the product was designed to deliver?
- **Engagement depth** — among users who return, how deeply are they using the product?

Note: with a cohort of five to twenty users, quantitative data is directional, not statistically significant. Present it as signal, not verdict.

### 3. Qualitative synthesis

Synthesise all qualitative feedback from the beta period. This is where Claude adds the most value — reading across many sources and surfacing themes that a human reviewing them sequentially might miss.

**BugDrop issues**
Read every issue labeled `beta-feedback`. Identify:
- Recurring themes (what came up more than once)
- The most emotionally charged feedback (positive and negative)
- Confusion patterns (what users tried to do that the product didn't support)
- Delight signals (moments where users expressed something unexpectedly positive)

**Weekly synthesis log**
Review `beta-feedback-log.md` for trends across the beta period. Did feedback shift over time? Did users who initially struggled later find value? Did early enthusiasm fade?

**Cohort conversation notes**
Incorporate the founder's notes from day 7 and day 30 check-ins. These carry more weight than in-product feedback because they reflect considered reflection rather than in-the-moment reactions.

Produce a qualitative synthesis narrative — not a list of individual data points, but a coherent reading of what users experienced and what it means.

### 4. Thesis evaluation

Return to the core documents from Track 1 and evaluate them against the evidence.

**Key Assumption (from Signal Brief)**
State the Key Assumption explicitly. Then answer: did the beta evidence support or contradict it? Be direct — this is the most important question in Phase 8.

**Thesis statement (from Thesis Document)**
Re-read the thesis. Was it right? Were the beliefs it rested on confirmed by user behaviour? What did users actually do versus what the thesis predicted they would do?

**Top three risks (from Thesis Document)**
Were any of the identified risks realised? Which risks turned out to be non-issues? Are there risks that emerged that were not anticipated?

**Net positive impact**
Evaluate the "value created, not just captured" question with actual data now available:
- Did users' lives or work improve in a measurable or observable way from using the product?
- Is there evidence of value diffusing beyond the direct transaction?
- Is there any evidence of negative impact that was not anticipated?

### 5. Produce a recommendation

Synthesise the quantitative evaluation, qualitative synthesis, and thesis evaluation into a single structured recommendation. This is AI-generated — the founder evaluates and decides.

Structure the recommendation as:

---

**Phase 8 Recommendation: [Venture Name]**
*Date · Skill: 8-learn v1.0 · Based on [N] days of beta data · [N] cohort users*

**Evidence summary**
[3–5 sentences. What the data shows, what users said, what surprised you.]

**Thesis verdict**
[Did the core assumption hold? Be direct: Confirmed / Partially confirmed / Contradicted]

**Net positive impact signal**
[What the evidence suggests about value created beyond the transaction]

**Recommended decision**
[Iterate / Pivot / Graduate / Kill]

**Reasoning**
[Why this recommendation follows from the evidence. What would have to change for a different recommendation to be warranted.]

**If Iterate:** [Specific: what to iterate on, what the v2 spec should prioritise]
**If Pivot:** [Specific: what the revised thesis should be, what Phase to return to]
**If Graduate:** [Specific: what Track 3 should focus on first]
**If Kill:** [Specific: what was learned, what this means for future ideas]

---

Present the recommendation to the founder. Do not advocate for it — present the evidence and the reasoning, then step back.

### 6. Gate — the decision

The founder makes the decision. Before presenting the options, this is a 1-way-door decision — run the adversarial review from `retro.md` against the recommendation. Surface the strongest case for each alternative before the founder confirms.

Present the four options with their mechanical implications:

**Iterate** — the thesis is validated at MVP level; the product is working but not yet at Track 3 threshold. Iterate within Track 2.
→ Return to Phase 4 with a v2 spec informed by Phase 8 learnings. The OKR updates. The backlog feeds the new spec. The beta cohort becomes the v2 test group.

**Pivot** — the approach needs revision, but the opportunity is still real. The product surfaced insight the Thesis Document missed.
→ Return to Phase 2 (Thesis) with the new insight. Or return to Phase 4 (Spec) if the thesis holds but the product scope needs to change. Document what changed and why.

**Graduate** — the product demonstrates strong PMF signals and is ready for Track 3. Graduation does not require the product to be perfect. Known fast-follow improvements belong in `BACKLOG.md` and are picked up in Track 3 — do not hold back graduation for improvements that can be made while scaling.
Indicators that support graduation: meaningful retention, organic growth or referrals, users who would be upset if the product went away, a clear path to monetisation, evidence of value beyond the core cohort.
→ Move to Track 3 — Ripen. Commit outstanding improvements to `BACKLOG.md` before transitioning. Note: Track 3 is a placeholder pending the first venture reaching this stage. The graduation decision triggers its development.

**Graduate, with Iteration** — positive signal alongside a specific fast-follow improvement that is worth addressing before fully scaling. Graduate is still the right decision; the improvement is a known Track 3 priority, not a reason to stay in Track 2.
→ Same path as Graduate. Log the improvement as a high-priority item in `BACKLOG.md` so Track 3 picks it up immediately.

**Kill** — the thesis failed. No fixable path forward.
→ Document the decision, reasons, and what was learned. Archive the venture's project folder. The learnings become institutional memory that informs future ventures.

---

### 7. Document the outcome

Regardless of the decision, produce a **Phase 8 Summary** — a short document committed to the venture's repo.

> **Session management:** Before starting the next phase, follow the session rules in `venture.md` — `/compact` for phase transitions within a track, new session for track transitions.

```markdown
# Phase 8 Summary — [Venture Name]
*Date · Decision: [Iterate / Pivot / Graduate / Kill]*

## Evidence basis
[2–3 sentences summarising the beta evidence]

## Thesis verdict
[Confirmed / Partially confirmed / Contradicted — and why]

## Decision
[The outcome and its rationale]

## Next steps
[What happens next, specifically]

## What we learned
[Key insights that apply beyond this venture — for the Satsuma institutional memory]
```

Commit this to the venture's repo. For Kill decisions, also add a top-level entry to `BACKLOG.md` noting that the venture was killed and linking to the Phase 8 Summary — this makes the history discoverable in future sessions.

---

## Guardrails

**Perspective:** Maintain the stance of a realistic, neutral analyst throughout this phase. The recommendation should follow the evidence. Do not soften a Kill recommendation because the founder is emotionally invested. Do not inflate an Iterate into a Graduate because the product shows some positive signals. Present what the data supports.

**The AI recommends; the founder decides.** Phase 8 is not a gate Claude passes the venture through — it is a structured process that produces the inputs to a human decision. The founder owns the outcome.

**Quantitative data is directional, not definitive.** A cohort of five to twenty users cannot produce statistically significant results. Treat Amplitude data as a signal that informs the qualitative picture, not as proof of anything.

**A Kill is a good outcome.** It is the playbook working correctly. Document it well — the learnings from a clean kill are some of the most valuable institutional memory a studio can accumulate.

**Graduate is the default on unclear signal.** Track 3 has its own kill gates. The cost of graduating early is bounded; the cost of staying in Track 2 indefinitely is not. When signal is positive or ambiguous, Graduate. When a specific fixable problem is identified, Iterate.

**Graduate does not require perfection.** Fast-follow improvements go into `BACKLOG.md`. Do not hold back graduation for work that can be done while scaling.

**Do not Iterate without a clear brief.** An Iterate decision that doesn't specify what the v2 spec should prioritise produces a directionless loop. The Phase 8 recommendation should make the v2 priorities explicit before returning to Phase 4.
