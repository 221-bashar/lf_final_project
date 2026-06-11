#!/usr/bin/env zsh
echo "=== NORTHSTAR LABS: SYSTEM SNAPSHOT ==="
echo "Timestamp:    $(date)"
echo "User:         $(whoami)"
echo "Shell:        $SHELL"
echo "Kernel:       $(uname -r)"
echo "Uptime:       $(uptime -p)"
echo ""
echo "--- Disk Usage ---"
df -h /
echo ""
echo "--- Memory Summary ---"
free -h 2>/dev/null || echo "free not available"
