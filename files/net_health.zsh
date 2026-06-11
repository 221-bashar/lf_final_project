#!/usr/bin/env zsh
echo "=== NORTHSTAR LABS: NETWORK HEALTH ==="
GATEWAY=$(ip route | awk '/default/ {print $3; exit}')
IFACE=$(ip route | awk '/default/ {print $5; exit}')
echo "Default Gateway: $GATEWAY"
echo "Active Interface: $IFACE"
echo "Active Route Info:"
ip route
echo ""
echo "DNS Resolvers:"
grep "nameserver" /etc/resolv.conf
echo ""
if [[ -z "$GATEWAY" ]]; then
  echo "[FAIL] No gateway found."
  exit 1
fi
echo "Testing Connectivity to Gateway ($GATEWAY) ..."
ping -c 2 "$GATEWAY" &>/dev/null && echo "[PASS] Gateway is reachable." || { echo "[FAIL] Gateway unreachable."; exit 1; }
