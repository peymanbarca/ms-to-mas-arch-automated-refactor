Generate a Python E2E test script based on migration/test_spec.json.

Requirements:
- Use ThreadPoolExecutor for concurrency
- Implement full workflow:
  search → cart → checkout
- Track:
  - per-step latency
  - total elapsed time
- Maintain dynamic variables (cart_id)

Output:
tests/e2e_runner.py