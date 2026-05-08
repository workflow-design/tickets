<div align="center">

# Will's Tickets

**Fractional product, engineering, AI and design projects at SF rates.**

![Rates verified](https://img.shields.io/badge/rates-verified%20against%20levels.fyi-2da44e?style=flat-square) ![Platform fees](https://img.shields.io/badge/platform%20fees-none-0969da?style=flat-square) ![Recruiters](https://img.shields.io/badge/recruiters-none-8957e5?style=flat-square)

[Browse open roles ↓](#open-roles) · [Install in Claude](#install) · [Hiring philosophy](./guides/hiring-philosophy/README.md)

</div>

---

## How it works

| For candidates | For employers |
| :--- | :--- |
| **1. Subscribe** — set your stack, disciplines, and rate floor in Claude. | **1. Post** — walk through `tickets-post` in Claude; first-time posts are auto-reviewed for quality. |
| **2. Match** — get an email the moment a role fits your profile. | **2. Match** — subscribers whose stack matches yours get alerted automatically. |
| **3. Apply** — one line in Claude submits a tailored application. | **3. Hire** — every applicant lands directly in your inbox. |

---

## Open Roles

<!-- TICKETS_OPEN_ROLES_START -->

**6 open roles** · last synced 2026-05-08

| Role | Company | Type | Hourly rate |
| --- | --- | --- | --- |
| [Set Up Personalized Fine-Tuning on Versey](./roles/versey-versey-personalized-fine-tuning.md) | [Versey](./companies/versey.md) | Engineering — Fractional, ~3–4 days | $175–225/hr |
| [Automate Versey's Hiring Backend + Outreach](./roles/versey-hiring-platform.md) | [Versey](./companies/versey.md) | Applied AI Engineering | $200–400/hr |
| [Build the Claude → Versey Handoff Feature](./roles/versey-claude-handoff.md) | [Versey](./companies/versey.md) | Product Engineering | $200–400/hr |
| [Build Interactive Tutorials for the Versey App](./roles/versey-interactive-tutorials.md) | [Versey](./companies/versey.md) | Product + Design + FE | $150–225/hr |
| [Build a Newsletter-Writer Use-Case Sub-Page on Versey.ai](./roles/versey-creators-page.md) | [Versey](./companies/versey.md) | Copy + Design + FE | $150–225/hr |
| [Build the Versey Homepage in Astro from a Figma Design](./roles/versey-homepage-astro.md) | [Versey](./companies/versey.md) | Frontend Engineering | $100–175/hr |

<!-- TICKETS_OPEN_ROLES_END -->

By applying you agree to the [Candidate Terms](./CANDIDATE_TERMS.md); by posting you agree to the [Employer Terms](./EMPLOYER_TERMS.md).

---

## Install

In Claude Code, paste:

```
install the skills from this repo https://github.com/workflow-design/tickets
```

That installs all six skills below. Then talk to Claude in plain English — `Subscribe to Tickets`, `Apply to <role url>`, `Post a role on Tickets`, etc.

| Skill | What it does |
| --- | --- |
| `tickets-profile` | Set up your candidate profile (used to filter and pre-fill everything else). |
| `tickets-list` | Browse open roles, filtered to your stack. |
| `tickets-apply` | Submit a tailored application to any role. |
| `tickets-subscribe` | Email alerts for new roles that match your profile. |
| `tickets-post` | Post a project (employers — free, no recruiter fees). |
| `tickets-manage` | Edit, pause, close, or reopen a role you posted. |

<details>
<summary>Manual install — one curl per skill</summary>

```bash
mkdir -p ~/.claude/skills/tickets-profile
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-profile/SKILL.md \
  -o ~/.claude/skills/tickets-profile/SKILL.md

mkdir -p ~/.claude/skills/tickets-list
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-list/SKILL.md \
  -o ~/.claude/skills/tickets-list/SKILL.md

mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md

mkdir -p ~/.claude/skills/tickets-subscribe
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-subscribe/SKILL.md \
  -o ~/.claude/skills/tickets-subscribe/SKILL.md

mkdir -p ~/.claude/skills/tickets-post
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-post/SKILL.md \
  -o ~/.claude/skills/tickets-post/SKILL.md

mkdir -p ~/.claude/skills/tickets-manage
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-manage/SKILL.md \
  -o ~/.claude/skills/tickets-manage/SKILL.md
```

</details>

---

## License

MIT. Fork it, run your own list.
