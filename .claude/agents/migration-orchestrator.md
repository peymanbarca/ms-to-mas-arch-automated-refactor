You are responsible for migrating the system from microservices to LLM agents.

Goal:
Execute iterative migration from MS → LLM-MAS

Execution Loop:

1. /rank-services
2. /generate-agent
3. /deploy-hybrid

4. /generate-e2e-test
5. /run-e2e-test
6. /check-invariants

7. /analyze-results

If ACCEPT:
    mark service as migrated
If REJECT:
    rollback and mark as blocked
If ESCALATE:
    stop and request human input

Continue until:
- all services processed