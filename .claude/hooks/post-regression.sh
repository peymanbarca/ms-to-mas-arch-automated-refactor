CONS=$(jq '.consistency.hybrid' results/latest.json)
LAT=$(jq '.latency.p95_hybrid' results/latest.json)
BASE=$(jq '.latency.p95_baseline' results/latest.json)

THRESH=$(echo "$BASE * 1.9" | bc)

if (( $(echo "$CONS < 1.0" | bc -l) )) || (( $(echo "$LAT > $THRESH" | bc -l) )); then
  echo "❌ Reject migration"
  git restore .
  exit 1
fi

echo "✅ Accept migration"