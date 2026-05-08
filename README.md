# Will's Tickets

Fractional product, engineering, AI and design projects at SF rates.

**[Install into Claude.ai](https://claude.ai/new?q=install+the+skills+from+here+https%3A%2F%2Fgithub.com%2Fworkflow-design%2Ftickets)**

Or install in Claude Code, paste:

```
install the skills from this repo https://github.com/workflow-design/tickets
```

Rates verified against [levels.fyi](https://www.levels.fyi). No platform fees, no recruiters. Email alerts when a project matches your stack.

💼 Got a project? Post for free.

Install the skills and ask Claude to post. See also our [Hiring Philosophy](./guides/hiring-philosophy/README.md)

---

## Open Roles

| Role                                                                                        | Company                         | Type                       | Hourly rate | Status      |
| ------------------------------------------------------------------------------------------- | ------------------------------- | -------------------------- | ----------- | ----------- |
| [Automate Versey's Hiring Backend + Outreach](./roles/versey-hiring-platform.md)            | [Versey](./companies/versey.md) | Applied AI Engineering     | $200–400/hr | Open        |
| [Build the Claude → Versey Handoff Feature](./roles/versey-claude-handoff.md)               | [Versey](./companies/versey.md) | Product Engineering        | $200–400/hr | Open        |
| [Build Interactive Tutorials for the Versey App](./roles/versey-interactive-tutorials.md)   | [Versey](./companies/versey.md) | Product + Design + FE      | $150–225/hr | Open        |
| [Build a Newsletter-Writer Use-Case Sub-Page on Versey.ai](./roles/versey-creators-page.md) | [Versey](./companies/versey.md) | Copy + Design + FE         | $150–225/hr | Open        |
| [Build the Versey Homepage in Astro from a Figma Design](./roles/versey-homepage-astro.md)  | [Versey](./companies/versey.md) | Frontend Engineering       | $100–175/hr | Open        |
| [Design and Build Versey's New Onboarding Flow](./roles/versey-onboarding-flow.md)          | [Versey](./companies/versey.md) | Product + Design + Eng     | $200–375/hr | Coming soon |
| [Add Conversion Animations to the Versey Homepage](./roles/versey-homepage-animations.md)   | [Versey](./companies/versey.md) | Design + Frontend (motion) | $150–225/hr | Coming soon |

By applying you agree to the [Candidate Terms](./CANDIDATE_TERMS.md); by posting you agree to the [Employer Terms](./EMPLOYER_TERMS.md).

---

## Manual Install Instructions & Instructions for AIs

The following skills can be installed in Claude.ai, Claude Cowork or Claude Code.

### `tickets-profile` — set up your candidate profile

Used by the other skills to pre-fill alerts and applications and to filter roles to your stack.

```bash
mkdir -p ~/.claude/skills/tickets-profile
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-profile/SKILL.md \
  -o ~/.claude/skills/tickets-profile/SKILL.md
```

Then in Claude: `Set up my Tickets profile`

### `tickets-apply` — apply to any role

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude: `Apply to <role url>`

### `tickets-subscribe` — get email alerts for matching roles

```bash
mkdir -p ~/.claude/skills/tickets-subscribe
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-subscribe/SKILL.md \
  -o ~/.claude/skills/tickets-subscribe/SKILL.md
```

Then in Claude: `Subscribe to Tickets`

### `tickets-post` — post a project (free)

```bash
mkdir -p ~/.claude/skills/tickets-post
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-post/SKILL.md \
  -o ~/.claude/skills/tickets-post/SKILL.md
```

Then in Claude: `Post a role on Tickets`

---

## License

MIT. Fork it, learn from it, run your own list.
