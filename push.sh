#!/bin/bash
# ===========================================
# Digital System Design Course - Push Script
# Pushes only RTL sources, testbenches, and
# constraint files to GitHub with flat paths
# ===========================================

set -e

echo "========================================="
echo "  Digital System Design - Push Script"
echo "========================================="

# Stage config files
echo "[1/4] Staging files..."
git add .gitignore push.sh 2>/dev/null || true

# Function: add file to git index at a flat path (ProjectFolder/filename)
add_flat() {
    local file="$1"
    local project=$(echo "$file" | sed 's|^\./||' | cut -d'/' -f1)
    local filename=$(basename "$file")
    local hash=$(git hash-object -w "$file")
    git update-index --add --cacheinfo 100644,"$hash","$project/$filename"
}

# Stage RTL source files
find . -path "*.srcs/sources_1/new/*" \( -name "*.v" -o -name "*.sv" -o -name "*.vhdl" -o -name "*.vhd" \) | while read -r f; do
    add_flat "$f"
done

# Stage testbench files
find . -path "*.srcs/sim_1/new/*" \( -name "*.v" -o -name "*.sv" -o -name "*.vhdl" -o -name "*.vhd" \) | while read -r f; do
    add_flat "$f"
done

# Stage constraint files
find . -path "*.srcs/constrs_1/new/*" -name "*.xdc" | while read -r f; do
    add_flat "$f"
done

# Show what will be committed
echo ""
echo "[2/4] Files staged for commit:"
git diff --cached --name-status
echo ""

# Check if there's anything to commit
if git diff --cached --quiet; then
    echo "No changes to commit. Everything is up to date!"
    exit 0
fi

# Commit with timestamp
echo "[3/4] Committing..."
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
git commit -m "Update Digital System Design files - $TIMESTAMP"

# Push to remote
echo ""
echo "[4/4] Pushing to GitHub..."
git push origin main

echo ""
echo "========================================="
echo "  Push complete!"
echo "========================================="
