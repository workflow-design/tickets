# Applied AI Engineering Project Brief

## Versey — AI-Powered Fractional Candidate Platform

**Company:** Versey ([versey.ai](http://versey.ai/))
**Supervisor:** [Will Taylor, CEO](https://www.linkedin.com/in/wrftaylor/)
**Project Type:** Dissertation / Final Year Project
**Domain:** Applied AI Engineering

---

## Overview

Versey's team needs to hire high-quality fractional engineers and designers for real projects, and is building an internal platform to automate the recruitment process. The unique innovation to attract great candidates is a **Chat-powered application experience** where candidates apply by chatting with an AI assistant rather than filling out traditional forms.

This project involves designing, building, and deploying a working version of this platform, focussed on workflow automation after the candidate submits an application. The student will work directly with the CEO as a stakeholder, using agile methodology to scope and deliver incremental value across sprints.

**Versey will provide:** API keys for foundational models and agentic engineering tools, access to internal systems (Linear, Slack, GitHub), project briefs, design assets, and regular stakeholder availability.

---

## The Problem

Versey's CEO currently has 7+ projects waiting to be staffed across engineering and design. The existing hiring process involves 12 manual steps — from defining a role, to LinkedIn outreach, to contracts, onboarding, and offboarding. The setup cost per hire frequently exceeds the cost of doing the work directly.

Current alternatives all fail:

- **Agencies and recruiters:** Expensive, slow, involve middlemen
- **Online Platforms e.g. Upwork:** Poor platform UX, inconsistent candidate quality
- **Personal network:** High quality but low volume — not a pipeline

The company has one fractional AI engineer who picks up work via Slack pings. That relationship proves the model works. The challenge is replicating it at scale without the manual overhead.

---

## The Vision

A platform where:

1. **Employers (ourselves for this pilot)** can create and post projects, trigger outreach, review applications, and manage the full hiring pipeline with minimal manual effort
2. **Candidates** can discover opportunities, chat with an AI assistant to learn about roles and prepare their application, and submit a complete application package — all through a conversational interface
3. **AI orchestrates** the process — from assembling candidate packages, to routing applications to the right pipeline stage, to automating onboarding and offboarding

---

## Technical Expectations

**Recommended stack:**

- Light frontend for the job portal (Astro on Vercel, or similar)
- Backend: student's choice — evaluate options and justify the decision
- Linear / Slack integrations for employer UX, Email integration for candidate UX
- Claude Code + Claude Skill / Claude Projects for the application experience

**AI/ML technologies:**

- Foundational models (Claude, others as appropriate) for the conversational application experience
- The specific AI/ML approaches used (candidate matching, NLP-based screening, profile enrichment, automated outreach) should be evaluated and proposed by the student as part of the project

---

## How This Project Works

### Agile Methodology

This project will be run using agile methodology, as the student would experience in industry:

1. **The requirements represent the full stakeholder vision.** They are intentionally broad. Not all of this can be built in a single dissertation.
2. **Part of the project is scoping.** The student should review the full requirements, propose which elements to tackle, and define realistic sprint goals.
3. **Sprints will be co-created** with the Versey team. The student will have regular access to the CEO as stakeholder for feedback, prioritization, and course correction.
4. **Incremental delivery is expected.** Working software at the end of each sprint, not a big-bang delivery at the end.

### What We're Looking For in Applicants

- Ability to take a broad, ambiguous set of requirements and propose a concrete plan
- Comfort with AI tooling and foundational models
- Full-stack engineering capability (or willingness to learn quickly)
- Product thinking — understanding why something matters, not just how to build it
- Initiative and communication — this is a real project with a real stakeholder, not a classroom exercise

### Success Criteria

The project succeeds if Versey is able to **make real hires through the platform**. Secondary criteria:

- Working, deployed software
- Demonstrated use of AI/ML in a meaningful way
- Clear documentation of technical decisions and trade-offs
- Evidence of agile process (sprint planning, retrospectives, iterative delivery)
- Software is left in a condition that is maintainable by the team

---

## Appendix: Stakeholder Interview

*Cleaned-up transcript of the requirements interview with Will Taylor, CEO of Versey. Treat this as primary source material when scoping the project.*

### The Pain

> I have a fractional AI engineer at the moment who just picks up random tickets that I ping them in Slack. It's a really amazing experience, and I want to multiply that for lots of projects and tasks in the business. Ideally, I'd end up with a roster of really good team members for different tasks so I can announce "Hey, I've got this project — can someone go fix it?" and they go address it.
>
> The problem is, if we want to do this for new hires, either we go through an agency (takes forever), a recruiter (super expensive), or Upwork (the platform is painful and the quality is low). I want some way of sharing a project, approving the best applicant, and getting them onboarded fast.
>
> For any one job, by the time I've set up our current process, I could have just done the job myself.

### The Current Process

> First we decide we want to add a role, then define what it looks like using an internal Scorecard based on the Who method. My founding operator sets up LinkedIn automations to find and reach out to candidates. My PA compiles a list of target companies and we look for people who might be a fit.
>
> After LinkedIn back-and-forth, if it seems interesting, we hop on a call. Might have a couple of interviews, or ideally just get them into a project right away. Then: Zoom brief, contract, IP agreement, system provisioning (Slack, GitHub, Figma depending on role), the work itself, invoicing at end of month, and offboarding at project end.
>
> Most of the good people I meet are through London tech communities and events. When I meet someone good, I give them work to build the relationship. But it's a trickle, not a pipeline.

### The Employer Experience

> I find it really hard to be a CEO when I'm getting sucked into supply-side tasks like design and engineering. It kills my ability to stay focused on the big picture. My goal is to never do supply-side work again. I'm happy if things cost a bit more or are a bit slower, as long as it's high-quality work done by other people.
>
> I have seven projects waiting right now:
>
> 1. Homepage update — converting a Figma design to Astro
> 2. New onboarding flow — mix of product, design, and engineering
> 3. Bring-your-own API keys feature — mostly backend
> 4. Interactive tutorials for the app — product, design, and frontend
> 5. Community setup in Slack with automations
> 6. Homepage animations to improve conversion
> 7. A feature where users start work in Claude and send it to our app
>
> I want to create these projects in Claude, get them posted to our portal, and trigger outreach automations. I want a dashboard in Linear where I can see applications in pipeline. I want to manage it all through Slack and Linear, occasionally hopping into a Zoom meeting for interviews.
>
> When someone applies, I want a really good quality package to decide on. If it's a design job, I want to see their past design work, their X profile, Figma work, a portfolio site. Similar for engineers. but I don't want to impose extra homework to the candidate as this will put off good candidates — I want to pull together the resources they already have.
>
> Once I've reviewed, I can say in Slack "This person seems good, book them in," and the agent handles the scheduling with candidate via email.

### The Candidate Experience

> The offer needs to seem absolutely amazing. SF rates for any gig. Every project comes with a minimum earning listed — about two days' worth of work. Flexible and remote. The work might continue beyond the initial project.
>
> Applying should be super easy. The person applies by submitting their application package over API, but their interaction is in Claude (Claude Code + G-Stack style Skill or Claude Projects) — they have a private chat to discuss the role before applying. There would also be a portal listing company information, the role, and FAQs, all of which Claude can pull from during the chat.
>
> The candidate can drop in their CV, authenticate LinkedIn, and Claude pulls missing information for the specific role. It can give them an indication of whether their application is strong. They can ask lots of questions privately without it coming through to us.
>
> They can also ask questions that do come through to us via Slack, with fast turnaround. That responsiveness would be shown on our company profile as a trust signal.
>
> The company profile should show signals that we're legit and will pay — how long we've been around, how many projects we've done (we've done 100+ on Upwork).
>
> Even if someone just wants one gig, they might want to monitor for future projects — so email or WhatsApp alerting for new listings. Search and filter as listings grow.
>
> Once they've applied once and set up that first application, applying again should be trivially easy, so we'll want to give applicants a package of files that they can re-upload to future roles, or stored profile after applying.
>
> Put another way: if I were looking for contracting work, this is how I'd want to find it. Applying is easy, it's a chat experience, the work is legit with good companies, onboarding is easy.

### On Quality and Culture

> A common failure mode is people come in and don't reach the bar we have. It's hard to communicate what the bar is without sounding toxic, but we have quite a high bar. I think a ways-of-working session or document would help.
>
> By high quality I mean YC alumni caliber. San Francisco rate remote workers.

### On Growth and Outreach

> How are we actually going to get people to find out about this? I picture automation around: reaching out on X, LinkedIn, scraping GitHub, using previous channels, finding people in Reddit communities and Hacker News.
>
> We could also do launch marketing — post about what we're doing so people can find us and sign up to hear about projects coming down the pipeline. A good list of people who want to take up jobs means we can fulfil them much quicker.
>
> Out of scope for now is any multi-employer support. But in the back of my mind, one day we could open-source this, or let other employers set it up, or do a managed service, or a traditional jobs board.

### On the Claude Application Experience

> Instead of building a whole chat experience, what I picture is there's a Claude skill or something that means people can do this in their own version of Claude. I don't want us to have to build a chat UI.
>
> If we had an API endpoint, Claude could just do a POST request to that endpoint.
>
> I kind of picture being able to click "Apply" and start chatting inside the normal Claude app as a slightly better experience. The Claude application experience is a big part of what makes this novel.
>
> For non-engineers (designers, product people), the web form fallback is important. But the Claude path should be the headline experience.

*End of stakeholder interview.*
