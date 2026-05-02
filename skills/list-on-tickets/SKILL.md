---
name: list-on-tickets
description: Help an employer create a high-quality listing on Tickets — a fractional engineering and design jobs list at github.com/workflow-design/tickets. Use whenever the user wants to post a project, list a role, hire a fractional engineer/designer through Tickets, add a company profile, or open a PR against the workflow-design/tickets repo. Walks the employer through a stakeholder-style interview, drafts the role and company markdown files following the Tickets voice, places them in the repo, and prepares a PR.
---

# List on Tickets

You are helping a Versey-style employer create a listing on Tickets. The deliverable is a clean PR against `github.com/workflow-design/tickets` containing:

1. A role page at `roles/<slug>.md` (always)
2. A company profile at `companies/<slug>.md` (only if their company isn't already listed)

Your job is to extract the right information through a stakeholder-style interview, then write both files in Tickets's voice.

## Tickets's voice

This is the most important section. Read it before you start the interview, and re-read it before you finalize copy.

- **Direct, concrete, no filler.** Name specific technologies, files, tools.
- **"The hard part:"** is a literal phrase used in every role listing. It's what separates Tickets listings from generic job boards. Good engineers read it and think "I can solve that."
- **Short paragraphs**, mix of one-sentence and 2–3 sentence runs. No bullet-point walls.
- **Honest about ambiguity.** "Loose spec exists" beats "comprehensive requirements document."
- **Banned phrases:** "exciting opportunity," "fast-paced environment," "passionate team," "competitive compensation," "rock star," "ninja," "we believe," "our values," "we're passionate about."
- **Required mindset:** Show that you've thought about the problem, not just the role. Surprises kill trust — better to say it upfront.

If a draft sounds like a press release, rewrite it. If it sounds like someone explaining their thinking over coffee, keep it.

## The interview

Run this as a conversation, not a form. Ask 1–3 questions at a time. Don't dump the full list.

### About the role

1. **What is this project, in one sentence?** Plain English.
2. **What tech stack or skills does it require?** Be specific — not "frontend" but "Astro + CSS animations" or "Figma + responsive design."
3. **What's the hard part?** This is the most important question. What would trip up a mediocre engineer? Where would someone cut corners? If the user can't answer, push: "What does great work look like here that mediocre work wouldn't?"
4. **How many hours, roughly?** Range is fine.
5. **What's the rate, or contract shape?** Default for fractional engineering/design is $150–200/hr. Also collect the **minimum earning per ticket** (Tickets default: ~2 days at the stated rate, e.g. $2.5k). Could be a fixed-fee project, equity, or other.
6. **Does anything already exist?** Brief, Figma file, repo, related code, prior context. Candidates want to know they're not walking into a blank page.
7. **What's the type of work?** Engineering, Design, Product, or a mix.
8. **Who's the stakeholder?** Name, title, LinkedIn. The person the contractor will report to.
9. **What does the first week look like?** Concrete deliverables.
10. **What's the apply path?** Default: reuse the existing `apply-on-tickets` Claude skill flow if the employer wants to wire into Linear, or a fallback email. If the employer wants their own skill, note it for a follow-up.

### About the company (skip if their company profile already exists in `companies/`)

1. **One-line description** of the company.
2. **Trust signals.** Years active, projects shipped, ratings, notable clients/customers, funding (if relevant). Why a candidate should believe they'll get paid.
3. **How they work.** Async/sync, brief-driven, meeting cadence, decision-making style. Concrete, not aspirational.
4. **Where they're based + remote policy.**
5. **Stakeholder contact** (name + email).
6. **Other roles** they expect to post in the next few months — list as "Coming soon."

## Rate verification (do this *before* drafting the listing)

Tickets stamps every listing with `Rate verified: levels.fyi` on the role page. This is the headline trust signal candidates look for, so don't skip it.

The methodology:

1. **Pick the comparable.** From the role's discipline + seniority, choose the closest levels.fyi job family and level. Senior IC fractional usually compares to L5 / L6 software engineer or design equivalents. Default region: SF Bay Area (SF rates is the floor for Tickets, regardless of where the candidate lives).
2. **Fetch the comparable.** Use WebFetch on the relevant levels.fyi page, e.g.:
   - `https://www.levels.fyi/t/software-engineer/locations/san-francisco-bay-area`
   - `https://www.levels.fyi/t/product-manager/locations/san-francisco-bay-area`
   - `https://www.levels.fyi/t/product-designer/locations/san-francisco-bay-area`
   Extract the **P50 total comp** for the relevant level. Note the URL and the fetch date.
3. **Convert to a fully-loaded hourly.** `fully_loaded_hourly = (total_comp_usd * 1.4) / 2080`. The 1.4 multiplier accounts for benefits, payroll taxes, equipment, and overhead the employer would pay on a full-time hire.
4. **Compare to the offered rate.** Fractional rates should clear the fully-loaded hourly to be financially neutral for the candidate (who self-funds benefits, taxes, equipment, and bears utilization risk).
   - **Pass:** offered rate ≥ fully-loaded P50 hourly. Stamp the role page with `Rate verified: levels.fyi (<discipline>, <region>, P50, fetched YYYY-MM-DD, <levels-url>)`.
   - **Borderline:** within 15% below. Flag to the employer: "you'll get applicants but the rate is below the levels.fyi P50 fully-loaded hourly. Want to raise it?" If they hold, stamp `Rate verified: levels.fyi — at-market` instead of P50.
   - **Fail:** more than 15% below. Do not stamp. Tell the employer the listing won't carry the verified mark, and explain why with the numbers. They can still post.
5. **Record the calculation in the PR description** — comparable URL, P50 number, fully-loaded hourly, offered rate, verdict. Traceability matters; an unverifiable verification stamp is worse than no stamp.

If levels.fyi has no comparable (e.g. founding-operator, very niche), use the closest comparable, disclose that on the role page (`Rate verified: levels.fyi (closest comparable: <role>, ...)`), and flag in the PR.

## Writing the files

Once you have answers, draft both files.

### Role file: `roles/<slug>.md`

`<slug>` is `<company>-<short-role-name>`, lowercase, hyphenated. Example: `versey-hiring-platform`, `acme-onboarding-redesign`.

Use this exact structure (the existing `roles/_template.md` in the repo is the canonical template — read it before writing):

```markdown
# [Role title]

**Company:** [../companies/<slug>.md]
**Type:** [e.g. Fractional Engineering, ~40 hrs over 4 weeks]
**Stakeholder:** [Name + LinkedIn]
**Rate:** [e.g. $150–200/hr]
**Minimum earning per ticket:** [e.g. $2.5k (~2 days)]
**Rate verified:** levels.fyi · [discipline] · SF Bay Area · P50 · fetched YYYY-MM-DD · [levels.fyi URL]
**Estimated hours:** [Range]
**Status:** Open

---

## What you'd build

[2–3 sentences. What the project is, what already exists, the headline outcome. Plain English.]

## The hard part

The hard part: [the specific thing that would trip up a mediocre engineer/designer. Honest about ambiguity.]

## What's in it for you

- [Concrete benefit]
- [Concrete benefit]
- [Concrete benefit]

## What we're looking for

- [Skill / experience]
- [Skill / experience]
- [Skill / experience]

## How to apply

### Apply in Claude (preferred)

[Reuse the `apply-on-tickets` skill instructions, or link to a custom skill if one is being shipped in the same PR.]

### Email fallback

Email **[contact email]** with name, links, and a 2-paragraph pitch.
```

### Company file: `companies/<slug>.md`

Match the structure of `companies/versey.md` in the repo. Read it before writing. The shape:

```markdown
# [Company]

[website] · [city/country] · [remote policy]

[One-line description.]

## Trust signals

- [Concrete signal]
- [Concrete signal]
- [Concrete signal]

## How they work

- [Concrete practice]
- [Concrete practice]

## Stakeholder

[Name, title, LinkedIn] · [contact email]

## Open roles from [Company]

- [Link to role file] — *Open*

## Coming soon

[Brief note about future planned roles, or omit if none.]
```

## Quality gates before opening the PR

Before staging the files for commit, walk the user through this checklist:

1. **Read the role aloud.** Does the "hard part" sentence make a strong engineer lean in? If not, rewrite.
2. **Would you apply at this rate?** If the answer isn't immediately yes, the listing needs work — usually it needs to be more honest about the ambiguity, or more specific about what already exists.
3. **Is there anything a candidate would discover in week one that isn't in the listing?** Surprises kill trust. Add it now.
4. **Trust signals are concrete?** "100+ projects on Upwork at 4.9★" is a signal. "We value quality" is not.
5. **No banned phrases?** Search for them.

Show the user the final markdown for both files. Get explicit confirmation.

## Opening the PR (terminal step — always do this)

The skill is not done until a PR is open against `workflow-design/tickets`. Don't stop at "here's your markdown." Walk all the way to the open PR.

1. **Confirm working copy.** Check whether the user has a fork of `workflow-design/tickets` cloned locally.
   - If yes, `cd` into it and pull latest `main`.
   - If no, run `gh repo fork workflow-design/tickets --clone` (use `gh` CLI). If `gh` isn't installed or authenticated, give the exact install/auth commands and stop until the user returns.
2. **Branch.** `git checkout -b list/<company>-<slug>`.
3. **Write the files:**
   - `roles/<slug>.md`
   - `companies/<slug>.md` (only if new company)
   - Append a row to the **Open Roles** table in `README.md`
   - Update the company profile's "Open roles" section to link to the new role
4. **Commit.** Suggested message: `Add role: <Role Title> (<Company>)`.
5. **Push.** `git push -u origin list/<company>-<slug>`.
6. **Open the PR with `gh`:**
   ```bash
   gh pr create \
     --repo workflow-design/tickets \
     --title "Add role: <Role Title> (<Company>)" \
     --body "<body>"
   ```
   Body must include:
   - Company + role summary (one paragraph)
   - Whether this is a new company or addition to an existing profile
   - Explicit line: "The employer has reviewed and agrees to [`EMPLOYER_TERMS.md`](../EMPLOYER_TERMS.md)."
7. **Return the PR URL** to the user. That's the deliverable.

If `gh` is unavailable, fall back to `git push` and print the exact GitHub compare URL to open the PR in a browser. Do not leave the user without a PR opened.

## Tone for the conversation itself

- Treat the employer as a peer, not a customer.
- Push back when answers are vague. "What's the hard part?" → "I want a great engineer" is not an answer; ask again with a sharper prompt.
- Be willing to say a draft isn't good enough. Quality of the listing directly determines quality of applicants — that's the deal.
- Keep it moving. The whole interview should take 10–15 minutes, not an hour.

## Edge cases

- **Employer wants to keep some details confidential** (rate, exact stakeholder identity): write the listing without them, but note in the PR description that some details will be shared with applicants directly.
- **Employer doesn't have a company profile yet and isn't sure what to put:** offer to draft from publicly available info (website, LinkedIn) and let them edit.
- **Employer is unsure about the apply path:** default to the existing `apply-on-tickets` skill flow with their email as the fallback contact. Note that wiring up a custom Linear/Slack pipeline is a follow-up PR.
- **Employer wants to post multiple roles:** run the interview once per role, but only create one company profile.
