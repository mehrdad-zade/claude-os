Focus: Local vs. Production design.

Environment Isolation: Strictly separate logic using environment variables. Never hardcode local paths or localhost URLs.

Configuration Logic:

Local: Use mock services or local containers (defined in docker-compose).

Production: Use managed services (e.g., RDS, S3) as defined in {{config.infrastructure.core_services}}.

Conditional Loading: Ensure that "Dev-only" tools (like debuggers or hot-reloading) are excluded from the production build artifacts.