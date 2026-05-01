# Claude Code Master Configuration

> **NEW PROJECT SETUP**: The only file you need to edit is `.claude/config.json`.
> Replace every `YOUR_*` placeholder in that file before starting work.
> Everything else — agents, rules, commands, memory — resolves from config at session start.

---

## Session Initialization Protocol

At the start of **every session**, before any other action:

1. **Read config** — Load `.claude/config.json` in its entirety.
2. **Resolve tokens** — All `{{config.path.to.value}}` tokens throughout agents, rules, and commands are resolved using the loaded config. Substitute them mentally for the duration of the session.
3. **Read memory** — Scan `.claude/memories/` for context continuity from prior sessions.
4. **Confirm state** — In one sentence, confirm the active project name, environment, and primary stack before proceeding.

---

## Project Identity

Resolved at session start from `config.project_identity`:

| Field | Config Key |
|-------|-----------|
| Name | `config.project_identity.name` |
| Version | `config.project_identity.version` |
| Environment | `config.project_identity.environment` |
| Root | `config.project_identity.root_directory` |

---

## Active Rules

@.claude/rules/engineering-standards.md
@.claude/rules/environment-segregation.md
@.claude/rules/security-and-logging.md
@.claude/rules/documentation-sync.md
@.claude/rules/structure-and-naming.md

---

## Agent Roster

All agents live in `.claude/agents/`. Each agent resolves its own stack context from `config.json`.
The escalation chain is: specialist agent → `architect-agent` → user.

| Agent ID | Default Tier | Responsibility |
|----------|-------------|----------------|
| `architect-agent` | high | Cross-service orchestration, structural planning, final arbitration |
| `frontend-expert` | medium | UI/UX implementation, component architecture, frontend testing |
| `backend-specialist` | medium | API design, business logic, backend testing |
| `db-architect` | medium | Schema design, migrations, query optimization |
| `devops-specialist` | medium | IaC, CI/CD, container orchestration, cloud provisioning |
| `security-auditor` | high | Vulnerability scanning, secrets audit, compliance enforcement |

**Specification mismatch protocol**: If any agent receives a request requiring a language, service, or dependency not listed in `config.json`, it must halt, state a `SPECIFICATION MISMATCH` error with the conflicting detail, and route to `architect-agent`. The architect then seeks explicit user authorization before proceeding.

---

## Model Tiers (Advisory)

Resolved from `config.llm_orchestration.tiers`. The model is fixed at session start — these tiers describe the **complexity level** of a task, not runtime model switching. Use them to calibrate reasoning depth.

| Tier | Model | Intent |
|------|-------|--------|
| `high` | `config.llm_orchestration.tiers.high.model` | Architecture, security-critical code, complex migrations |
| `medium` | `config.llm_orchestration.tiers.medium.model` | Feature implementation, testing, integration work |
| `low` | `config.llm_orchestration.tiers.low.model` | Boilerplate, linting, docs, simple scripts |

Context caching is enabled on all tiers. Default tier: `config.llm_orchestration.default_tier`.

---

## Available Commands

Defined as slash commands in `.claude/commands/`. Invoke by name during a session.

| Command | Trigger | Description |
|---------|---------|-------------|
| `/universal-runner` | Local dev | Start all services via docker-compose |
| `/test-suite` | Any change | Run all frontend and backend tests |
| `/audit-sec` | Pre-PR | Static analysis and dependency vulnerability scan |
| `/infra-plan` | Before deploy | Generate IaC execution plan for review |
| `/deploy-app` | Post-approval | Apply infrastructure changes |
| `/db-migrate` | Schema change | Execute schema migrations (non-production only) |

---

## Memory State

Persistent session memory lives in `.claude/memories/`. Read all three at session start.
Update the relevant file before ending any session that includes a structural change.

| File | Tracks |
|------|--------|
| `dependency-graph.json` | Service-to-service contracts and shared schema sync status |
| `infrastructure-state.json` | Last known cloud service states and deployment timestamps |
| `naming-exceptions.json` | Approved deviations from the global naming convention |

---

## Project Documentation

Updated per the `documentation-sync` rule on every structural or logic change.

| File | Purpose |
|------|---------|
| `Architecture.md` | System design, component diagrams, pivot log with timestamps |
| `Requirements.md` | Functional and non-functional requirements, fulfillment status |
| `Sprints/` | Sprint planning, task tracking, blockers |
| `ReadMe.md` | Setup instructions, dependencies, developer onboarding |

---

## Behavioral Constraints

Resolved from `config.behavioral_settings`:

- **Code naming**: `{{config.behavioral_settings.code_naming_convention}}`
- **File naming**: `{{config.behavioral_settings.file_naming_convention}}`
- **Component naming**: `{{config.behavioral_settings.component_naming_convention}}`
- **Constants**: `{{config.behavioral_settings.constants_naming_convention}}`
- **Indentation**: `{{config.behavioral_settings.indentation}}`
- **Security checks enforced**: `{{config.behavioral_settings.security_checks_enabled}}`

Any deviation from the configured stack (`config.stack_specification`) or infrastructure (`config.infrastructure`) requires explicit user authorization. Do not introduce new dependencies, languages, or cloud services without documented approval.
