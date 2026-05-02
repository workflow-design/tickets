# Tickets

Fractional product, engineering and design projects at SF rates. Apply by chatting with Claude.

Ideal for underemployed founders, PMs, designers and engineers.

- **SF rates, verified against [levels.fyi](https://www.levels.fyi)** — every listing rate-checked before it goes live.
- **Apply by chatting with Claude** — one `curl`, every role on the list.
- **No platform fees, no recruiters** — direct, free for both sides.
- **Email alerts** when a project matches your stack.

Need something done? Post projects for free — see [how to post](#how-to-post).

---

## Open Roles

| Role                                                                           | Company                         | Type                   | Hourly rate | Min earning | Status |
| ------------------------------------------------------------------------------ | ------------------------------- | ---------------------- | ----------- | ----------- | ------ |
| [Build the Tickets Hiring Platform Backend](./roles/versey-hiring-platform.md) | [Versey](./companies/versey.md) | Applied AI Engineering | $200–400/hr | $4k         | Open   |

Hourly rates verified against [levels.fyi](https://www.levels.fyi) before a listing goes live — see each role page for the comparable used and the fetch date.

Nothing suitable? [Subscribe](#subscribe) and we'll email you when a matching project goes up.
Got a project? [Post it on Tickets](#how-to-post). It's free!

New to fractional work? Read the guides:

- [How to start out with fractional candidates](./guides/EMPLOYERS.md) — for employers
- [How to start out with fractional projects](./guides/CANDIDATES.md) — for candidates

---

## How to Apply

Every role on this list uses the same flow: install one Claude skill, then chat with Claude to apply.

### 1. Install the apply skill

One `curl`, one skill, every role on the list. The skill pulls in the role page, the company profile, and any other context it needs.

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
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

### Optional: save a profile so apply / list / subscribe auto-fill

```bash
mkdir -p ~/.claude/skills/tickets-profile
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-profile/SKILL.md \
  -o ~/.claude/skills/tickets-profile/SKILL.md
```

Then in Claude:

```
Set up my Tickets profile
```

The profile (name, email, disciplines, stack, links, availability) lives only on your machine at `~/.claude/skills/tickets-profile/profile.json`. With it set, `tickets-list` only shows roles that match, `tickets-apply` only asks you for the pitch, and `tickets-subscribe` is one confirm away.

---

## Subscribe

Get an email when a new project matching your stack goes up. Unsubscribe anytime.

```bash
mkdir -p ~/.claude/skills/tickets-subscribe
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-subscribe/SKILL.md \
  -o ~/.claude/skills/tickets-subscribe/SKILL.md
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
- **A listing that actually attracts good people.** The `tickets-post` skill writes in a voice that respects engineers — concrete, honest about the hard part, no "rock star" filler. Strong listings convert; generic ones don't.
- **Zero lock-in.** No exclusivity, no contract with us, no fees. Hire whoever you want, however you want. We're a list, not an agency.
- **Mutually beneficial.** More good projects on the list strengthens the inbound flow for every employer. That's the whole reason this is free.

The trade is simple: you write a clear brief, we route it to the right people. Quality of the listing determines quality of the applicants.

### How to post

Install the `tickets-post` Claude skill — it interviews you, drafts the listing in the Tickets voice, and submits it to the Tickets backend (no PR, no fork). The role markdown is generated automatically and shows up in the public repo within seconds.

```bash
mkdir -p ~/.claude/skills/tickets-post
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-post/SKILL.md \
  -o ~/.claude/skills/tickets-post/SKILL.md
```

Then in Claude:

```
Post a role on Tickets
```

You'll need an author token to submit. Email the maintainers ([accounts@workflow.design](mailto:accounts@workflow.design)) once and you're set for all future posts.

This is mutually beneficial. More projects on the list means a stronger inbound flow of underemployed candidates for every employer. We don't take a cut. We don't gate the relationship.

By posting a project, you agree to the [Employer Terms](./EMPLOYER_TERMS.md).

---

## Repo Layout

```
.
├── README.md                       # this page
├── EMPLOYER_TERMS.md               # employer conduct + liability
├── CANDIDATE_TERMS.md              # candidate conduct + data + liability
├── roles/                          # auto-generated from the Tickets backend (do not edit by hand)
├── companies/                      # one markdown file per employer
├── guides/                         # how to start out with fractional work
│   ├── EMPLOYERS.md
│   └── CANDIDATES.md
├── skills/tickets-apply/        # candidate: apply to a role
├── skills/tickets-subscribe/    # candidate: subscribe to alerts
├── skills/tickets-list/         # browse open roles
├── skills/tickets-profile/      # candidate: local profile that pre-fills the others
└── skills/tickets-post/         # employer: post a role
```

## License

MIT. Fork it, learn from it, run your own list.
