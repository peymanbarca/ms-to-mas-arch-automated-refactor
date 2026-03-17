Convert a microservice into an LLM-based agent.

Input:
- Service name

Steps:
1. Analyze service API endpoints
2. Extract request/response schemas
3. Identify downstream dependencies from service_graph.json

4. Generate agent:
   - FastAPI wrapper preserving endpoints
   - LLM-based decision logic using ollama and langgraph
   - Tool calls for downstream services

5. Create prompt template:
   - Include business rules
   - Include invariants
   - Include structured output format

6. Ensure:
   - Deterministic output format (JSON)
   - No hallucinated fields

Output:
agents/{service_name}/