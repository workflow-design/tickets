# Tickets

Fractional product, engineering and design projects at SF rates. Apply by chatting with Claude.

Ideal for underemployed founders, PMs, designers and engineers.

- **SF rates, verified against [levels.fyi](https://www.levels.fyi)** — every listing rate-checked before it goes live.
- **Apply by chatting with Claude** — one `curl`, every role on the list.
- **No platform fees, no recruiters** — direct, free for both sides.
- **Email alerts** when a project matches your stack.

Need something done? List projects for free — just [open a PR](#want-to-add-a-project).

---

## Open Roles

| Role                                                                           | Company                         | Type                   | Hourly rate | Min earning | Status |
| ------------------------------------------------------------------------------ | ------------------------------- | ---------------------- | ----------- | ----------- | ------ |
| [Build the Tickets Hiring Platform Backend](./roles/versey-hiring-platform.md) | [Versey](./companies/versey.md) | Applied AI Engineering | $200–400/hr | $4k         | Open   |

Hourly rates verified against [levels.fyi](https://www.levels.fyi) before a listing goes live — see each role page for the comparable used and the fetch date.

Nothing suitable? [Subscribe](#subscribe) and we'll email you when a matching project goes up.
Got a project? [Open a PR](#want-to-add-a-project). It's free!

New to fractional work? Read the guides:

- [How to start out with fractional candidates](./guides/EMPLOYERS.md) — for employers
- [How to start out with fractional projects](./guides/CANDIDATES.md) — for candidates

---

## How to Apply

Every role on this list uses the same flow: install one Claude skill, then chat with Claude to apply.

### 1. Install the apply skill

One `curl`, one skill, every role on the list. The skill pulls in the role page, the company profile, and any other context it needs.

```bash
mkdir -p ~/.claude/skills/apply-on-tickets
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/apply-on-tickets/SKILL.md \
  -o ~/.claude/skills/apply-on-tickets/SKILL.md
```

### 2. Open Claude and apply

In Claude Code or Claude Desktop, say:

```
Apply to [paste url of job here]
```

For example:

```
Apply to github.com/workflow-design/tickets/blah
```

Claude will ask which role, fetch the role page and company profile, help you sharpen your pitch, and submit a complete package. Your application lands in the employer's pipeline immediately and they get a Slack alert.

By subscribing or applying, you agree to the [Candidate Terms](./CANDIDATE_TERMS.md).

---

## Subscribe

Get an email when a new project matching your stack goes up. Unsubscribe anytime.

```bash
mkdir -p ~/.claude/skills/subscribe-to-tickets
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/subscribe-to-tickets/SKILL.md \
  -o ~/.claude/skills/subscribe-to-tickets/SKILL.md
```

Then in Claude:

```
Subscribe to Tickets
```

Claude asks for your name, email, disciplines (engineering / design / product / founding-operator), and stack — that's the minimum. Optional: minimum rate, current role, links. Takes about a minute.

---

## Want to add a Project?

You post a role. We email it to a list of underemployed senior engineers and designers who've already opted in. They apply by chatting with Claude, and a structured package — CV, links, sharpened pitch — lands in your pipeline. No recruiter cut, no platform fee, no middleman.

What you get:

- **Distribution to people who don't browse job boards.** The applicant list is selected for the philosophy above — escalating trust, async, outcome-driven. Generic candidates self-deselect.
- **Richer applications than a resume drop.** The Claude skill assembles a complete package and pushes back on weak pitches before submission.
- **A listing that actually attracts good people.** The `list-on-tickets` skill writes in a voice that respects engineers — concrete, honest about the hard part, no "rock star" filler. Strong listings convert; generic ones don't.
- **Zero lock-in.** No exclusivity, no contract with us, no fees. Hire whoever you want, however you want. We're a list, not an agency.
- **Mutually beneficial.** More good projects on the list strengthens the inbound flow for every employer. That's the whole reason this is free.

The trade is simple: you write a clear brief, we route it to the right people. Quality of the listing determines quality of the applicants.

### How to list

The fastest way is to install the `list-on-tickets` Claude skill — it interviews you, drafts the role and company files in the Tickets voice, and opens the PR for you.

```bash
mkdir -p ~/.claude/skills/list-on-tickets
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/list-on-tickets/SKILL.md \
  -o ~/.claude/skills/list-on-tickets/SKILL.md
```

Then in Claude:

```
List a role on Tickets
```

Or do it by hand:

1. Add a markdown file under [`roles/`](./roles) following the [template](./roles/_template.md).
2. Add or update your company profile under [`companies/`](./companies) to give candidates more context.
3. Open a PR. We'll review, merge, and email the listing to relevant applicants on our list.

This is mutually beneficial. More projects on the list means a stronger inbound flow of underemployed candidates for everyone. We don't take a cut. We don't gate the relationship. We just route well-scoped work to people who want it.

By submitting a project, you agree to the [Employer Terms](./EMPLOYER_TERMS.md).

---

## Repo Layout

```
.
├── README.md                       # this page
├── EMPLOYER_TERMS.md               # employer conduct + liability
├── CANDIDATE_TERMS.md              # candidate conduct + data + liability
├── roles/                          # one markdown file per role (open or coming-soon)
│   ├── _template.md
│   ├── versey-hiring-platform.md
│   ├── versey-homepage-astro.md
│   ├── versey-onboarding-flow.md
│   ├── versey-byok-api-keys.md
│   ├── versey-interactive-tutorials.md
│   ├── versey-slack-community.md
│   ├── versey-homepage-animations.md
│   ├── versey-claude-handoff.md
│   └── versey-creators-page.md
├── companies/                      # one markdown file per employer
│   └── versey.md
├── guides/                         # how to start out with fractional work
│   ├── EMPLOYERS.md
│   └── CANDIDATES.md
├── skills/apply-on-tickets/        # universal apply-to-any-role Claude skill
├── skills/subscribe-to-tickets/    # candidate subscribe-for-alerts Claude skill
└── skills/list-on-tickets/         # employer listing-author Claude skill
```

## License

MIT. Fork it, learn from it, run your own list.
