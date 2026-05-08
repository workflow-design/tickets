# Will's Tickets

Fractional product, engineering, AI and design projects at SF rates.

Rates verified against [levels.fyi](https://www.levels.fyi). No platform fees, no recruiters. Email alerts when a project matches your stack.

In Claude Code, paste:

```
install the skills from this repo https://github.com/workflow-design/tickets
```

💼 Got a project? Post for free.

Install the skills and ask Claude to post. See also our [Hiring Philosophy](./guides/hiring-philosophy/README.md)

---

## Open Roles

<!-- TICKETS_OPEN_ROLES_START -->

| Role                                                                                        | Company                         | Type                       | Hourly rate |
| ------------------------------------------------------------------------------------------- | ------------------------------- | -------------------------- | ----------- |
| [Automate Versey's Hiring Backend + Outreach](./roles/versey-hiring-platform.md)            | [Versey](./companies/versey.md) | Applied AI Engineering     | $200–400/hr |
| [Build the Claude → Versey Handoff Feature](./roles/versey-claude-handoff.md)               | [Versey](./companies/versey.md) | Product Engineering        | $200–400/hr |
| [Build Interactive Tutorials for the Versey App](./roles/versey-interactive-tutorials.md)   | [Versey](./companies/versey.md) | Product + Design + FE      | $150–225/hr |
| [Build a Newsletter-Writer Use-Case Sub-Page on Versey.ai](./roles/versey-creators-page.md) | [Versey](./companies/versey.md) | Copy + Design + FE         | $150–225/hr |
| [Build the Versey Homepage in Astro from a Figma Design](./roles/versey-homepage-astro.md)  | [Versey](./companies/versey.md) | Frontend Engineering       | $100–175/hr |

<!-- TICKETS_OPEN_ROLES_END -->

By applying you agree to the [Candidate Terms](./CANDIDATE_TERMS.md); by posting you agree to the [Employer Terms](./EMPLOYER_TERMS.md).

---

## Manual Claude Code Install Instructions

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

### `tickets-manage` — edit, pause, close, or reopen a role you posted

```bash
mkdir -p ~/.claude/skills/tickets-manage
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-manage/SKILL.md \
  -o ~/.claude/skills/tickets-manage/SKILL.md
```

Then in Claude: `Manage my Tickets roles`

---

## License

MIT. Fork it, run your own list.
