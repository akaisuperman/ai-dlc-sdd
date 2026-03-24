#!/usr/bin/env bash
set -euo pipefail

DOCS="docs"

exists() { [[ -f "$1" ]]; }

echo "=== aiteam Status ==="
echo ""

# Check base structure
if [[ ! -d "$DOCS/specs" ]]; then
  echo "[MISS] docs/specs/ — chạy aiteam-setup trước"
  exit 1
fi

# Overview
if exists "$DOCS/specs/overview.md"; then
  echo "[OK]   docs/specs/overview.md"
else
  echo "[MISS] docs/specs/overview.md — chạy aiteam-plan"
  exit 0
fi

# Status
if exists "$DOCS/status.md"; then
  echo "[OK]   docs/status.md"
else
  echo "[MISS] docs/status.md"
fi

echo ""
echo "=== Modules ==="

# Scan modules
if [[ -d "$DOCS/specs/modules" ]]; then
  for spec in "$DOCS/specs/modules"/*.md; do
    [[ -f "$spec" ]] || continue
    module=$(basename "$spec" .md)

    spec_status="spec:done"
    review_status="review:--"
    impl_status="impl:--"

    # Check review
    if exists "$DOCS/reviews/${module}.md"; then
      review_status="review:done"
    fi

    # Check if feature branch exists
    if git rev-parse --verify "feature/${module}" >/dev/null 2>&1; then
      impl_status="impl:in-progress"
    fi

    echo "  ${module}: ${spec_status} | ${review_status} | ${impl_status}"
  done
else
  echo "  (chưa có module specs)"
fi

echo ""
echo "=== Contracts ==="

if [[ -d "$DOCS/specs/contracts" ]]; then
  count=$(find "$DOCS/specs/contracts" -name "*.md" 2>/dev/null | wc -l)
  echo "  ${count} contract(s)"
else
  echo "  (chưa có contracts)"
fi

echo ""
echo "=== Decisions ==="

if [[ -d "$DOCS/decisions" ]]; then
  count=$(find "$DOCS/decisions" -name "*.md" 2>/dev/null | wc -l)
  echo "  ${count} decision(s)"
else
  echo "  (chưa có decisions)"
fi

echo ""
echo "=== Đề xuất ==="

# Suggest next step
has_specs=false
has_unreviewed=false

if [[ -d "$DOCS/specs/modules" ]]; then
  for spec in "$DOCS/specs/modules"/*.md; do
    [[ -f "$spec" ]] || continue
    has_specs=true
    module=$(basename "$spec" .md)
    if ! exists "$DOCS/reviews/${module}.md"; then
      has_unreviewed=true
      echo "  → Module '${module}' chưa review — chạy aiteam-review"
    fi
  done
fi

if [[ "$has_specs" = false ]]; then
  echo "  → Chưa có module specs — chạy aiteam-spec"
elif [[ "$has_unreviewed" = false ]]; then
  echo "  → Tất cả specs đã review — chạy aiteam-implement"
fi
