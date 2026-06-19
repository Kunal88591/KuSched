#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BIN="$ROOT/kusched"
TESTDIR="$ROOT/testcases"

if [ ! -x "$BIN" ]; then
  echo "Binary not found. Run 'make' first." >&2
  exit 2
fi

passed=0
failed=0

for in_file in "$TESTDIR"/*-input.txt; do
  base=$(basename "$in_file" "-input.txt")
  out_file="$TESTDIR/${base}-output.txt"
  if [ ! -f "$out_file" ]; then
    echo "Skipping $base (no expected output)"
    continue
  fi

  printf "Running %s... " "$base"
  if timeout 5s "$BIN" < "$in_file" > /tmp/kusched_out.txt; then
    if diff -u "$out_file" /tmp/kusched_out.txt >/dev/null; then
      echo "PASS"
      passed=$((passed+1))
    else
      echo "FAIL"
      echo "--- Expected: $out_file"
      echo "--- Actual:   /tmp/kusched_out.txt"
      diff -u "$out_file" /tmp/kusched_out.txt || true
      failed=$((failed+1))
    fi
  else
    echo "ERROR (timeout or runtime error)"
    failed=$((failed+1))
  fi
done

echo
echo "Results: $passed passed, $failed failed"
[ $failed -eq 0 ]
