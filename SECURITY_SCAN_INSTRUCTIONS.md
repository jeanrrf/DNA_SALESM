# Security Scan Instructions

This repository contains a small helper script to run a local secret scan using gitleaks.

Files added:

- `scripts/run-gitleaks.sh` — runs gitleaks locally (if installed) or via Docker as fallback. Outputs JSON report into `reports/gitleaks-report.json`.

How to run the scan locally

1. Install gitleaks (recommended):
   - Binary: https://github.com/zricethezav/gitleaks#install
   - Or via Homebrew: `brew install gitleaks`

2. OR ensure Docker is installed and running.

3. From the root of this repository:

```bash
chmod +x scripts/run-gitleaks.sh
./scripts/run-gitleaks.sh
```

4. Review the generated report at `reports/gitleaks-report.json`.

Next steps after scan

- Any secrets found should be rotated immediately.
- Replace secrets with references to GitHub Secrets / Vault.
- Consider adding the gitleaks GitHub Action to block pushes that contain secrets.

Example GitHub Action (suggested):

```yaml
name: gitleaks-scan
on: [push, pull_request]
jobs:
  gitleaks:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run gitleaks
        uses: zricethezav/gitleaks-action@v1
        with:
          args: detect --source . --report-format json --report-path reports/gitleaks-report.json
```
