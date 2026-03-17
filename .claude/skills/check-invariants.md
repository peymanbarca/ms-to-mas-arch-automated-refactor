Validate system consistency using MongoDB state.

Inputs:
- migration/db_config.json
- migration/invariants.json
- 
Steps:
1. Load DB config
2. Connect to each database
3. Execute queries per invariant
4. Compute metrics
   failure_score
   consistency_rate = 1 - normalized_failure

Output:
results/consistency.json