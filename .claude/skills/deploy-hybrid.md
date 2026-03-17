Deploy hybrid system:
- Replace selected microservice with agent using docker compose
- Keep others unchanged

Steps:
1. Build agent container using the same port of the original service
2. Replace service in docker-compose
3. Start system

Ensure:
- Same endpoints
- Same service name (for routing)