#!/usr/bin/env bash
# run-gitleaks.sh
# Script to run gitleaks secret scan locally and output JSON report
# Requirements: gitleaks installed (https://github.com/zricethezav/gitleaks) or Docker

set -euo pipefail

REPORT_DIR="reports"
REPORT_JSON="$REPORT_DIR/gitleaks-report.json"

mkdir -p "$REPORT_DIR"

if command -v gitleaks >/dev/null 2>&1; then
  echo "Running gitleaks locally..."
  gitleaks detect --source . --report-path "$REPORT_JSON" --report-format json
  echo "Report written to $REPORT_JSON"
  exit 0
fi

# Fallback to Docker
if command -v docker >/dev/null 2>&1; then
  echo "gitleaks not found locally, running via Docker..."
  docker run --rm -v "$(pwd):/src" zricethezav/gitleaks:latest detect --source /src --report-path /src/$REPORT_JSON --report-format json
  echo "Report written to $REPORT_JSON"
  exit 0
fi

echo "Please install gitleaks (https://github.com/zricethezav/gitleaks) or Docker to run the secret scan."
exit 1
