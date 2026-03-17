Analyze the microservice system and rank services by migration risk.

Inputs:
- migration/service_graph.json
- service source code

Steps:
1. Compute fan-out for each service
2. Compute betweenness centrality
3. Estimate cyclomatic complexity from code
4. Normalize metrics
5. Compute weighted risk score

Output:
migration/ranking.json

Sort ascending (lowest risk first).