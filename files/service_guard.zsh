#!/usr/bin/env zsh
echo "=== NORTHSTAR LABS: SERVICE GUARD ==="
if command -v systemctl &>/dev/null; then
  echo "Method: systemctl"
  systemctl status ssh --no-pager
  STATUS=$?
else
  echo "Method: service (fallback)"
  service ssh status
  STATUS=$?
fi
if [[ $STATUS -eq 0 ]]; then
  echo "[PASS] SSH service is healthy."
  exit 0
else
  echo "[FAIL] SSH service is not running."
  exit 1
fi
