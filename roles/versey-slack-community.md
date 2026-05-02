# Set Up the Versey Slack Community + Automations

**Company:** [Versey](../companies/versey.md)
**Type:** Operations / Community Engineering
**Stakeholder:** [Will Taylor, CEO](https://www.linkedin.com/in/wrftaylor/)
**Rate:** $100–150/hr (L3 → L4 band)
**Minimum earning per ticket:** $1.6k (~2 days at the L3 floor)
**Seniority:** Junior to Mid (L3–L4) — has set up at least one Slack/Discord community before, not a first attempt
**Rate verified:** levels.fyi · closest comparable: Software Engineer (community/ops engineer not directly listed), trimmed for non-product-eng work · SF Bay Area · L3–L4 · P50 · fetched 2026-04-27
**Stack:** Standalone — bot stack is the candidate's choice (Slack Bolt + TypeScript on Vercel is a sensible default; Workflow Builder for the no-code rituals)
**Estimated hours:** _TODO_
**Status:** Coming soon

---

## What you'd build

Stand up Versey's user community in Slack and ship the automations around it: invite + onboarding flow for new members, channel structure, welcome bot, intro thread prompt, weekly digest, integrations with the Versey app for events worth surfacing in-channel.

## The hard part

The hard part: setting it up so that Will doesn't become the community manager. The automation isn't impressive on its own — the trick is the orchestration that handles new joiners, surfaces the right threads, and quietly sweeps stale channels, so an active community runs without anyone full-time on it.

## What's in it for you

- Greenfield community setup. You decide channel structure, automation surfaces, integrations.
- _TODO — anything else?_

## What we're looking for

- Has set up an active Slack or Discord community and run it. Not just configured channels — designed the rituals.
- Comfortable with Slack API + bots / Slack Workflow Builder / a tool of your choice.
- _TODO — preferred stack for the bots (TypeScript / Bolt? Python? Hosted on Vercel? Cloudflare Workers?)._

## First ticket

_TODO — first deliverable. (e.g. "Workspace + initial channels stood up, welcome flow live, first automation working end-to-end.")_

## How to apply

### Apply in Claude

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to versey-slack-community on Tickets
```
