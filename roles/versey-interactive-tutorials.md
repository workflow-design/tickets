# Build Interactive Tutorials for the Versey App

**Company:** [Versey](../companies/versey.md)
**Type:** Design — Product + Design + Frontend
**Rate:** $150–225/hr (L4 → L5 band)
**Stack:** apps/web — Next.js 16, React 19, Tailwind 4. There's an existing scripts/build-tutorials.mjs scaffold to inherit and extend.
**Status:** Open

---

## What you'd build

In-app interactive tutorials that teach users the main mechanics of the Versey app — anchored to real UI, not video walkthroughs. Product (what to teach, in what order), design (the in-app affordance), and frontend (build it).

## The hard part

The hard part: tutorial UX that helps without nagging. Users hate "tour" overlays, but they also fail to discover the app's good ideas without prompting. The bar is: by tutorial 3, the user has the *aha* — and they've never been blocked from doing what they came to do.

## What's in it for you

- A feature with a measurable outcome (activation rate, time-to-aha).
- End-to-end ownership across product / design / frontend.
- _TODO — anything else?_

## What we're looking for

- Has shipped an in-app tutorial / onboarding overlay that actually moved a metric.
- _TODO — frontend stack the app is built on._
- Strong instinct for "show, don't tell" UX patterns. Can name three tutorial libraries / approaches and the trade-offs.

## First ticket

_TODO — first deliverable. (e.g. "Tutorial flow for the single most-important mechanic, behind a feature flag, with activation-rate instrumentation.")_

## How to apply

All roles on Tickets use the universal `tickets-apply` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to versey-interactive-tutorials on Tickets
```
