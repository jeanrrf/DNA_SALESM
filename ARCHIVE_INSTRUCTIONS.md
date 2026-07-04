# Archive Instructions

I prepared a non-destructive workflow to archive candidate repositories. Because I cannot change repository settings directly from this automation environment, please run the script below locally with the GitHub CLI to perform archiving in batch.

Files added:

- `archive-repos.sh` — Bash script that lists candidate repos and runs `gh repo archive OWNER/REPO --confirm` for each. It asks for an explicit "yes" confirmation before running.

Why this approach:
- Archiving requires repository admin rights and the GitHub API calls that this environment cannot perform directly.
- Running locally with your authenticated `gh` CLI ensures the operation is performed under your account and is auditable in the GitHub audit log.

How to run:

1. Install GitHub CLI: https://cli.github.com/
2. Authenticate: `gh auth login` (use an account with admin rights on the repos)
3. From this repo (clone if needed) run:

```bash
chmod +x archive-repos.sh
./archive-repos.sh
```

Notes:
- The script contains a curated list of candidate repositories to archive. Edit the `REPOS` array in the script if you want to add or remove entries before running.
- The script is conservative and requires typing `yes` to proceed.
- Archiving is reversible (you can unarchive via `gh repo unarchive OWNER/REPO`).

If you prefer, I can also:
- Create issues in this repo listing each candidate and a one-click checklist.
- Generate the exact `curl` commands to archive repos via the REST API (you can run them with a PAT).

Tell me if you want me to create issues now or produce the curl commands.
