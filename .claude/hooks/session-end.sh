#!/bin/bash
# Fires on the Stop event (Claude finishes responding).
# Reminds Claude to persist any significant session changes to .claude/memories/
# so the next session has accurate context without re-deriving state.

printf '{"hookSpecificOutput":{"hookEventName":"Stop","additionalContext":"[memory-check] Before finishing: if this session included schema changes, new service integrations, API contract changes, new infra resources, or approved naming deviations, update the relevant memory file: dependency-graph.json | infrastructure-state.json | naming-exceptions.json"}}\n'

exit 0
