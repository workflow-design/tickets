# Add Conversion Animations to the Versey Homepage

**Company:** [Versey](../companies/versey.md)
**Type:** Design + Frontend
**Stakeholder:** [Will Taylor, CEO](https://www.linkedin.com/in/wrftaylor/)
**Rate:** $150–225/hr (L4 → L5 band)
**Minimum earning per ticket:** $3k (~2 days at the L4 floor)
**Seniority:** Mid to Senior (L4–L5) with motion specialism — specialism beats level here
**Rate verified:** levels.fyi · Frontend Software Engineer (motion comparable) · SF Bay Area · L4–L5 · P50 · fetched 2026-04-27 · [levels.fyi/t/software-engineer/focus/front-end/locations/san-francisco-bay-area](https://www.levels.fyi/t/software-engineer/focus/front-end/locations/san-francisco-bay-area)
**Stack:** `apps/www` — Astro 5.7 on Vercel. Pairs naturally with the homepage Astro rebuild (`versey-homepage-astro`).
**Estimated hours:** ~30–50 hrs (hero + 2–3 scroll-driven sections, behind a feature flag, with Lighthouse + conversion baselines)
**Status:** Coming soon

---

## What you'd build

Conversion-oriented animations on the Versey homepage — micro-interactions, scroll-driven motion, the hero. The point isn't decoration; it's making the value prop click visually in the first three seconds.

## The hard part

The hard part: motion that lifts conversion without tanking LCP or annoying anyone on a second visit. Most homepage animation work picks one or the other — beautiful and slow, or fast and flat. You need both: the page has to feel premium *and* score well on Core Web Vitals.

## What's in it for you

- A measurable outcome. We instrument before/after.
- A design surface where motion is the work, not a footnote.

## What we're looking for

- Has shipped homepage / landing animations on a real product. Can show before/after, or talk about why specific frames are timed the way they are.
- Strong CSS + a motion library of choice (Framer Motion / GSAP / CSS-only). Justify the pick.
- Comfortable in Astro on Vercel — the homepage lives in `apps/www`.

## First ticket

Hero animation shipped behind a feature flag with before/after Lighthouse + conversion baselines.

## How to apply

### Apply in Claude

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to versey-homepage-animations on Tickets
```
