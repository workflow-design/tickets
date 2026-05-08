# Build Beacon Forge's Usage-Event Ingestion Pipeline

**Company:** [Beacon Forge](../companies/beacon-forge.md)

**Type:** Engineering — Fractional, ~80–120 hrs over 6 weeks

**Rate:** $200–275/hr (L5 band)

**Location:** Remote

**Stack:** typescript, kafka, clickhouse, postgres

**Status:** Open

---

Replace Beacon Forge's batch usage-event ingestion with a real streaming pipeline: Kafka in, ClickHouse for analytics, Postgres for the source of truth. The hard part is exactly-once delivery into the billing surface — duplicate events become duplicate invoice line items.

**Stakeholder:** [Founder, CTO](https://linkedin.com/in/beacon-forge-founder)

**Minimum earning per ticket:** $3.2k (~2 days at the L5 floor)

**Rate verified:** levels.fyi · Software Engineer overall (L5 cut not separable on public page) · SF Bay Area · P50 $272.5k → $183/hr fully-loaded · fetched 2026-05-08 · https://www.levels.fyi/t/software-engineer/locations/san-francisco-bay-area

**Estimated hours:** ~80–120 hrs over 6 weeks

## What you'd build

A streaming ingestion pipeline for customer usage events: Kafka topic per tenant, ClickHouse for fast aggregation queries against the analytics surface, Postgres as the source of truth for billable rollups. Today it's a nightly batch job that reads from S3 dumps — late events break invoices and reconciliation is manual.

## The hard part

The hard part: exactly-once delivery into the billing surface. Duplicate events become duplicate invoice line items, and customers notice. You'll be designing the dedup strategy (idempotency keys, watermarks, late-arrival handling) and the reconciliation tooling that proves it works before each billing cycle closes.

## What's in it for you

- Greenfield streaming setup — pick the topology, pick the dedup approach.
- Direct ownership of the billing-critical path. Tight feedback loop with the founder.

## What we're looking for

- Has shipped a production streaming pipeline that backed a billing or financial system.
- Comfortable with Kafka + ClickHouse + Postgres at the level of reading the docs and the source.
- Writes reconciliation tooling proactively — proves correctness, doesn't hope for it.

## First ticket

Audit the existing batch pipeline, document every billing-critical edge case (late events, replays, schema drift), and ship the streaming path for a single tenant in shadow mode alongside the batch job.

## How to apply

All roles on Tickets use the universal `tickets-apply` skill. Standard install:

```bash
mkdir -p ~/.claude/skills/tickets-apply
curl -fsSL https://raw.githubusercontent.com/workflow-design/tickets/main/skills/tickets-apply/SKILL.md \
  -o ~/.claude/skills/tickets-apply/SKILL.md
```

Then in Claude:

```
Apply to beacon-forge-usage-events-pipeline on Tickets
```
