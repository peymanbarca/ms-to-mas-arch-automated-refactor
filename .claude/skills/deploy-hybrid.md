Deploy hybrid system by replacing selected microservice with its LLM agent.

Input:
- service_name
- migration state (accepted agents list)

Goal:
- Replace target microservice with its agent container
- Keep all other services unchanged
- Ensure system remains runnable

Steps:

1. Identify target:
   - Locate service in docker-compose.yml
   - Extract:
     - service name
     - port mappings
     - environment variables
     - dependencies

2. Determine agent status:
   - If agent is newly generated → build image
   - If agent was previously accepted → reuse existing image (do not regenerate)

3. Generate Dockerfile for agent (if not exists):

   agents/{service_name}/Dockerfile:

   - Base image: python:3.10-slim
   - Set working directory
   - Copy:
       - agent code
       - common llm loader
       - migration/llm_config.json
   - Install dependencies:
       fastapi
       uvicorn
       langchain
       langgraph
       langchain-ollama
       requests
       pymongo
   - Expose SAME port as original service
   - Start command:
       uvicorn main:app --host 0.0.0.0 --port <service_port>

4. Create/update agent image:

   docker build -t agent_{service_name}:latest agents/{service_name}/

5. Modify docker-compose.yml:

   Replace ONLY the selected service with:

   service_name:
     build: ./agents/{service_name}
     container_name: agent_{service_name}
     ports:
       - "<original_port>:<original_port>"
     environment:
       - MONGO_URL=<same as original>
       - DB_NAME=<same as original>
       - LLM_CONFIG_PATH=/app/migration/llm_config.json
     depends_on:
       - (same dependencies)

   IMPORTANT:
   - Keep service name EXACTLY the same (for choreography compatibility)
   - Do NOT change other services

6. Preserve previously accepted agents:
   - Ensure their services remain pointing to agent images
   - Do NOT revert accepted agents back to microservices

7. Deploy system:

   docker-compose up -d --build

8. Wait for system readiness:
   - Check container health
   - Retry for up to 60 seconds

Ensure:
- Same endpoints
- Same service name (routing compatibility)
- Same port
- No breaking changes to other services
- Agents are stateless (state remains in DB)
- LLM config is accessible inside container

Output:
- Updated docker-compose.yml
- Dockerfile (if created)
- Deployment status