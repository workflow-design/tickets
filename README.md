<div align="center">

# Tickets

**Free jobs board for fractional product, engineering, AI and design projects at SF rates.**

![Rates verified](https://img.shields.io/badge/rates-verified%20against%20levels.fyi-2da44e?style=flat-square) ![Platform fees](https://img.shields.io/badge/platform%20fees-none-0969da?style=flat-square) ![Recruiters](https://img.shields.io/badge/recruiters-none-8957e5?style=flat-square)

[Browse open roles ↓](#open-roles) · [Install in Claude](#install) · [Hiring philosophy](./guides/hiring-philosophy/README.md)

</div>

---

## How it works

| For candidates                                                              | For employers                                                                   |
| :-------------------------------------------------------------------------- | :------------------------------------------------------------------------------ |
| **1. Apply in seconds** via `Apply to <role>` in Claude Code.               | **1. Post free.** Describe your role to Claude Code, it shapes up your listing. |
| **2. Get matched.** Set your stack once; we email you when a role fits.     | **2. Match** — subscribers whose stack matches yours get alerted automatically. |
| **3. Get hired.** Employers reply straight from the email.                  | **3. Hire** — every applicant lands directly in your inbox.                     |

---

## Open Roles

<!-- TICKETS_OPEN_ROLES_START -->

**8 open roles** · last synced 2026-05-08

| Role | Company | Type | Hourly rate |
| --- | --- | --- | --- |
| [Set Up Personalized Fine-Tuning on Versey](./roles/versey-versey-personalized-fine-tuning.md) | Versey | Engineering — Fractional, ~3–4 days | $175–225/hr |
| [Set Up the Versey Slack Community + Automations](./roles/versey-slack-community.md) | Versey | Engineering — Operations / Community Engineering | $100–150/hr (L3 → L4 band) |
| [Design and Build Versey's New Onboarding Flow](./roles/versey-onboarding-flow.md) | Versey | Design — Product + Design + Engineering | $200–375/hr (L5 → L6 band, full-stack product premium) |
| [Build Interactive Tutorials for the Versey App](./roles/versey-interactive-tutorials.md) | Versey | Design — Product + Design + Frontend | $150–225/hr (L4 → L5 band) |
| ~~[Build the Versey Homepage in Astro from a Figma Design](./roles/versey-homepage-astro.md)~~ — _taken_ | ~~Versey~~ | ~~Engineering — Frontend Engineering~~ | ~~$100–175/hr (L3 → L4 band)~~ |
| [Add Conversion Animations to the Versey Homepage](./roles/versey-homepage-animations.md) | Versey | Design — Design + Frontend | $150–225/hr (L4 → L5 band) |
| [Automate Tickets' Hiring Backend + Outreach](./roles/tickets-hiring-platform.md) | Tickets | Engineering — Fractional AI Engineering · ongoing, ~10–20 hrs/week | $200–400/hr (L5 → L6 band) |
| [Build a Creators Use-Case Sub-Page on Versey.ai](./roles/versey-creators-page.md) | Versey | Design — Frontend + Copy + Design | $150–225/hr (L4 → L5 band) |
| [Build the Claude → Versey Handoff Feature](./roles/versey-claude-handoff.md) | Versey | Product — Backend + Product Engineering | $200–400/hr (L5 → L6 band, AI integration premium) |

<!-- TICKETS_OPEN_ROLES_END -->

By applying you agree to the [Candidate Terms](./CANDIDATE_TERMS.md); by posting you agree to the [Employer Terms](./EMPLOYER_TERMS.md).

---

## Install

In Claude Code, paste:

```
install the skills from this repo https://github.com/workflow-design/tickets
```

That installs all six skills below. Then talk to Claude in plain English — `Subscribe to Tickets`, `Apply to <role url>`, `Post a role on Tickets`, etc.

| Skill               | What it does                                                                 |
| ------------------- | ---------------------------------------------------------------------------- |
| `tickets-profile`   | Set up your candidate profile (used to filter and pre-fill everything else). |
| `tickets-list`      | Browse open roles, filtered to your stack.                                   |
| `tickets-apply`     | Submit a tailored application to any role.                                   |
| `tickets-subscribe` | Email alerts for new roles that match your profile.                          |
| `tickets-post`      | Post a project (employers — free, no recruiter fees).                        |
| `tickets-manage`    | Edit, pause, close, or reopen a role you posted.                             |

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

## About

Built by the ex-founders of [Rota](https://rota.com) — one of the UK's largest on-demand temporary staffing platforms, running ~3,000 placements a week. Tickets is what we'd build for the AI-fluent end of that market: smaller, faster, more agenty.

---

## License

MIT. Fork it, run your own list.
