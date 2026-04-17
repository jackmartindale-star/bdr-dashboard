#!/bin/bash
# Double-click this file to push the latest CSV to GitHub and update the dashboard.

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

echo "------------------------------------"
echo "  Flint BDR Dashboard — Push Update"
echo "------------------------------------"
echo ""

# Check for changes to the CSV
if git diff --quiet "BDR Stats - All Time.csv" && git ls-files --others --exclude-standard "BDR Stats - All Time.csv" | grep -q .; then
  echo "No changes detected in the CSV file."
  echo "Make sure you saved the file before running this."
  echo ""
  read -p "Press Enter to close..."
  exit 0
fi

git add "BDR Stats - All Time.csv"
git commit -m "Update BDR stats — $(date '+%B %d, %Y')"
git push

echo ""
echo "Done! The dashboard will update in about 60 seconds."
echo "Visit: https://jackmartindale-star.github.io/bdr-dashboard/"
echo ""
read -p "Press Enter to close..."
