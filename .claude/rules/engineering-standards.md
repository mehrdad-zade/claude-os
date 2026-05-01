Focus: Modular solutions, best practices, and error handling.

Modular Architecture: All new features must be isolated into independent modules or services. Avoid tightly coupled logic; use dependency injection or clear interface boundaries.

Error Management:

Zero-Warning Policy: You are required to address all linter warnings and compiler errors before presenting code.

Graceful Degradation: Implement try-catch blocks or error-return patterns that provide meaningful feedback without crashing the process.

Clean Code: Adhere to the DRY (Don't Repeat Yourself) and SOLID principles. Functions should have a single responsibility and be limited to 30 lines where possible.