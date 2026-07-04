#!/usr/bin/env bash
# archive-repos.sh
# Use this script locally to archive a list of repositories in the github account
# Requirements: GitHub CLI (gh) installed and authenticated with an account that has admin rights to the repos.

set -euo pipefail

REPOS=(
  "jeanrrf/stable-diffusion-webui"
  "jeanrrf/yt-dlp-gui"
  "jeanrrf/FORTNITE"
  "jeanrrf/sentinnell-playground-music"
  "jeanrrf/SSX--01"
  "jeanrrf/codespaces-react"
  "jeanrrf/ai-elements"
  "jeanrrf/nextjs-blog-theme"
)

echo "The following repositories are *candidates* for archiving:"
for r in "${REPOS[@]}"; do
  echo "  - $r"
done

read -p "Are you sure you want to archive these repositories? Type 'yes' to proceed: " CONFIRM
if [ "$CONFIRM" != "yes" ]; then
  echo "Aborting. No changes made."
  exit 0
fi

for r in "${REPOS[@]}"; do
  echo "Archiving $r ..."
  gh repo archive "$r" --confirm || { echo "Failed to archive $r"; }
  echo "Done: $r"
done

echo "All done. If any archives failed, run the commands manually or check permissions." 
