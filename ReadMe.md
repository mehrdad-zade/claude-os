# [PROJECT_NAME]

<!-- SETUP INSTRUCTIONS
Replace [PROJECT_NAME] and fill in each section before onboarding any developer.
Update whenever a new dependency, environment variable, or setup step is added.
-->

[TODO: One-sentence description of what this project does]

## Prerequisites

<!-- List all tools that must be installed before setup. -->

- [TODO: e.g. Go 1.22+]
- [TODO: e.g. Node.js 20+]
- [TODO: e.g. Docker Desktop]
- [TODO: e.g. Terraform 1.7+]

## Environment Setup

1. Clone the repository
2. Copy the environment template:
   ```bash
   cp .env.example .env
   ```
3. Fill in all required values in `.env` (see [Environment Variables](#environment-variables) below)
4. Start local services:
   ```bash
   docker-compose up
   ```

## Environment Variables

<!-- List every required environment variable. Never put real values here. -->

| Variable | Required | Description |
|----------|----------|-------------|
| `DATABASE_URL` | Yes | PostgreSQL connection string |
| `REDIS_URL` | Yes | Redis connection string |
| [TODO] | [Yes/No] | [TODO: description] |

## Running Tests

```bash
# Run all tests
/test-suite

# Or manually per service:
# [TODO: add per-service test commands]
```

## Project Structure

```
.
├── backend/          # [TODO: primary backend description]
├── workers/          # [TODO: worker service description]
├── web/              # [TODO: frontend description]
├── infra/            # Terraform / IaC
├── .claude/          # Claude Code configuration
└── Sprints/          # Sprint planning
```

## Deployment

See `Architecture.md` for infrastructure overview.
Use `/infra-plan` to preview changes, then `/deploy-app` after review.

## Contributing

- Follow conventions in `.claude/rules/`
- Run `/audit-sec` before opening a PR
- Update `Sprints/` and `Requirements.md` when completing tasks
