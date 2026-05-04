# Build the Versey Homepage in Astro from a Figma Design

**Company:** [Versey](../companies/versey.md)
**Type:** Engineering — Frontend Engineering
**Rate:** $100–175/hr (L3 → L4 band)
**Stack:** [apps/www](https://github.com/) — Astro 5.7 on Vercel, in the Versey Turborepo (pnpm + Turbo)
**Status:** Open

---

## What you'd build

Convert an existing Figma design of the Versey homepage into a production Astro build, deployed to Vercel and wired into the existing site repo.

## The hard part

The hard part: matching the Figma design pixel-perfect — type scale, spacing, dark/light variants, component states — while keeping the bundle small and the LCP good. The site is a marketing surface; performance and visual fidelity both matter. There is _no_ design system to lean on yet, so you're building primitives at the same time as the page.

## What's in it for you

- Greenfield Astro work with a clean Figma source and one decisive stakeholder.
- Anything you ship is publicly visible and credit-able.

## What we're looking for

- Production Astro experience. Comfortable with the islands model and Vercel's edge runtime.
- Strong CSS — design-system thinking, fluid type, motion sensibilities. Not just "I can write Tailwind."
- Has shipped at least one Figma-to-code build that the designer signed off on without rework.

## First ticket

Hero + nav, deployed to a preview URL, signed off against the Figma frame.

## How to apply

All roles on Tickets use the universal `tickets-apply` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to versey-homepage-astro on Tickets
```
