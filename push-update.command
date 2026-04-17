#!/bin/bash
# Double-click this file to push the latest CSV to GitHub and update the dashboard.

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

echo "------------------------------------"
echo "  Flint BDR Dashboard — Push Update"
echo "------------------------------------"
echo ""
echo "Repo: $REPO_DIR"
echo ""

git add "BDR Stats - All Time.csv"

if git diff --cached --quiet; then
  echo "No changes detected in the CSV."
  echo "Make sure you saved the updated file to:"
  echo "  $REPO_DIR/BDR Stats - All Time.csv"
  echo ""
  read -p "Press Enter to close..."
  exit 0
fi

git commit -m "Update BDR stats — $(date '+%B %d, %Y')"
git push

echo ""
echo "Done! The dashboard will update in about 60 seconds."
echo "Visit: https://jackmartindale-star.github.io/bdr-dashboard/"
echo ""
read -p "Press Enter to close..."
