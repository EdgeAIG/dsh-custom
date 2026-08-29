#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
command -v dsh >/dev/null || { echo "install @deepseek-ai/dsh first"; exit 1; }
for p in remote-trust llm-opencode web-search subagent-defaults config-ui; do
  echo "→ $p"
  dsh plugin --profile web add "file:${ROOT}/$p" || true
done
echo "Done. Restart: dsh web --host 0.0.0.0"
