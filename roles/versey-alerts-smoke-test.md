# Alerts Smoke Test

**Company:** [Versey](../companies/versey.md)
**Type:** engineering — Fractional, ~1 day
**Rate:** $200/hr
**Status:** Open

---

A throwaway listing to verify the alert pipeline sends an email through Resend.

## Context\nIf you got an email about this, the pipeline works.

## How to apply

All roles on Tickets use the universal `apply-on-tickets` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/apply-on-tickets
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/apply-on-tickets/SKILL.md \
  -o ~/.claude/skills/apply-on-tickets/SKILL.md
```

Then in Claude:

```
Apply to versey-alerts-smoke-test on Tickets
```
