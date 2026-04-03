#!/usr/bin/env bash
set -euo pipefail

DOCS="docs/ai"
errors=0
warnings=0

echo "=== aiteam Validation ==="
echo ""

# Check base structure
echo "--- Structure ---"
for dir in specs specs/modules specs/contracts reviews decisions; do
  if [[ -d "$DOCS/$dir" ]]; then
    echo "[OK]   $DOCS/$dir/"
  else
    echo "[ERR]  $DOCS/$dir/ missing"
    ((errors++))
  fi
done

# Check required files
echo ""
echo "--- Required Files ---"
for file in specs/overview.md status.md; do
  if [[ -f "$DOCS/$file" ]]; then
    echo "[OK]   $DOCS/$file"
  else
    echo "[ERR]  $DOCS/$file missing"
    ((errors++))
  fi
done

# Check overview has EST
echo ""
echo "--- Overview Spec ---"
if [[ -f "$DOCS/specs/overview.md" ]]; then
  if grep -q "total_est" "$DOCS/specs/overview.md" 2>/dev/null; then
    echo "[OK]   overview.md has total_est"
  else
    echo "[WARN] overview.md missing total_est in frontmatter"
    ((warnings++))
  fi
fi

# Check modules have specs
echo ""
echo "--- Module Specs ---"
if [[ -d "$DOCS/specs/modules" ]]; then
  module_count=0
  for spec in "$DOCS/specs/modules"/*.md; do
    [[ -f "$spec" ]] || continue
    ((module_count++))
    module=$(basename "$spec" .md)
    echo "[OK]   Module: $module"

    # Check EST in module spec
    if ! grep -q "total_est\|Tong EST\|EST:" "$spec" 2>/dev/null; then
      echo "       [WARN] Missing EST"
      ((warnings++))
    fi

    # Check 5 sections
    for section in "Overview" "Architecture" "Contracts" "Implementation" "Acceptance"; do
      if ! grep -qi "$section" "$spec" 2>/dev/null; then
        echo "       [WARN] Missing section: $section"
        ((warnings++))
      fi
    done
  done

  if [[ $module_count -eq 0 ]]; then
    echo "[WARN] No module specs found"
    ((warnings++))
  fi
else
  echo "[WARN] No modules directory"
  ((warnings++))
fi

# Check contracts referenced in overview exist
echo ""
echo "--- Contracts ---"
if [[ -d "$DOCS/specs/contracts" ]]; then
  contract_count=0
  for contract in "$DOCS/specs/contracts"/*.md; do
    [[ -f "$contract" ]] || continue
    ((contract_count++))
    echo "[OK]   $(basename "$contract")"
  done
  if [[ $contract_count -eq 0 ]]; then
    echo "[INFO] No contracts (OK if modules are independent)"
  fi
fi

# Check reviews
echo ""
echo "--- Reviews ---"
if [[ -d "$DOCS/reviews" ]]; then
  review_count=0
  for review in "$DOCS/reviews"/*.md "$DOCS/reviews"/**/*.md; do
    [[ -f "$review" ]] || continue
    ((review_count++))
  done
  echo "[INFO] $review_count review(s) found"
fi

# Check decisions
echo ""
echo "--- Decisions ---"
if [[ -d "$DOCS/decisions" ]]; then
  decision_count=0
  for decision in "$DOCS/decisions"/*.md; do
    [[ -f "$decision" ]] || continue
    ((decision_count++))
  done
  echo "[INFO] $decision_count decision(s) found"
fi

# Summary
echo ""
echo "=== Summary ==="
echo "Errors:   $errors"
echo "Warnings: $warnings"

if [[ $errors -gt 0 ]]; then
  echo ""
  echo "FAIL: Fix errors above before proceeding."
  exit 1
else
  echo ""
  echo "PASS: Structure is valid."
  exit 0
fi
