# Project: Microservices → LLM-MAS Migration

## System Description
- 8 microservices
- REST-based communication
- Decentralized choreography (no central orchestrator)
- Synchronous API calls

## Migration Objective
Transform services incrementally into LLM-based agents while preserving:
- API compatibility
- System invariants
- Latency constraints

## Migration Strategy
1. Rank services by:
   - Fan-out (dependency count)
   - Betweenness centrality
   - Cyclomatic complexity
2. Migrate one service at a time (lowest risk first)
3. Replace service with LLM agent wrapper
4. Run regression validation

## Acceptance Criteria
- ΔConsistency = 0%
- ΔLatency ≤ 1.9 × baseline p95
- API failure rate ≤ 1%

## System Invariants (examples)
- No negative inventory
- Order state consistency
- Payment processed exactly once
- Shipment created once per order

## Constraints
- Preserve REST API contracts
- No schema changes during migration
- Agents must call downstream services as tools

## Available Commands
- /rank-services
- /generate-agent
- /deploy-hybrid
- /run-regression
- /analyze-results
- /rollback

## Iteration Policy
Continue until all 9 services are migrated or blocked.