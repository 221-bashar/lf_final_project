#!/usr/bin/env zsh
LOGFILE="$HOME/lf_final_project/logs/ops.log"
SCRIPT_DIR="$HOME/lf_final_project/scripts"
log() { echo "[$(date)] $1" | tee -a "$LOGFILE"; }

case "$1" in
  --help)
    echo "Usage: ops_tool.zsh [--status|--snapshot|--netcheck|--svccheck|--all|--help]"
    ;;
  --status)
    log "=== STATUS ==="
    log "User: $(whoami) | Shell: $SHELL | Kernel: $(uname -r)"
    ;;
  --snapshot)
    log "=== SNAPSHOT START ==="
    zsh "$SCRIPT_DIR/system_snapshot.zsh" | tee -a "$LOGFILE"
    ;;
  --netcheck)
    log "=== NETCHECK START ==="
    zsh "$SCRIPT_DIR/net_health.zsh" | tee -a "$LOGFILE"
    ;;
  --svccheck)
    log "=== SVCCHECK START ==="
    zsh "$SCRIPT_DIR/service_guard.zsh" | tee -a "$LOGFILE"
    ;;
  --all)
    log "=== ALL CHECKS START ==="
    zsh "$SCRIPT_DIR/system_snapshot.zsh" | tee -a "$LOGFILE"
    zsh "$SCRIPT_DIR/net_health.zsh" | tee -a "$LOGFILE"
    zsh "$SCRIPT_DIR/service_guard.zsh" | tee -a "$LOGFILE"
    log "=== ALL CHECKS COMPLETE ==="
    ;;
  *)
    echo "[ERROR] Unknown option: $1"
    echo "Run with --help for usage."
    exit 1
    ;;
esac
