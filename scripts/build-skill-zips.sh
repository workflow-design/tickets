#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT_DIR/dist/skill-zips"
SKILLS_DIR="$ROOT_DIR/skills"

SKILLS=(
  "tickets-profile"
  "tickets-apply"
  "tickets-subscribe"
  "tickets-post"
)

mkdir -p "$OUT_DIR"
rm -f "$OUT_DIR"/*.zip

for skill in "${SKILLS[@]}"; do
  (
    cd "$SKILLS_DIR"
    zip -qr "$OUT_DIR/${skill}.zip" "$skill"
  )
done

echo "Built ZIPs in $OUT_DIR"
