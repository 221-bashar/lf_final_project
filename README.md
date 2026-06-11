# Linux Fundamentals Final Project — Automation Track

**Northstar Labs Operations Toolkit**  
A script-driven operations toolkit that monitors host state, validates network/service health, and produces scheduled logs with actionable status output.

---

## Project Structure

```
lf_final_project/
├── scripts/
│   ├── system_snapshot.zsh   # System state snapshot
│   ├── net_health.zsh        # Network health check
│   ├── service_guard.zsh     # SSH service monitor
│   └── ops_tool.zsh          # Main dispatcher
├── logs/
│   └── ops.log               # Structured log output
├── reports/
│   └── permissions_audit.txt
└── README.md
```

---

## Scripts

### `system_snapshot.zsh`
Prints a full system summary including timestamp, current user, shell, kernel version, uptime, disk usage, and memory.

```bash
zsh scripts/system_snapshot.zsh
```

### `net_health.zsh`
Shows active network interface, default route, gateway ping result, and DNS resolver info. Exits non-zero if gateway is unreachable.

```bash
zsh scripts/net_health.zsh
```

### `service_guard.zsh`
Checks SSH service health using `systemctl` with fallback to `service`. Returns exit code `0` if healthy, `1` if not running.

```bash
zsh scripts/service_guard.zsh
```

### `ops_tool.zsh` — Main Dispatcher
Central tool that runs all checks and logs output to `logs/ops.log`.

```bash
zsh scripts/ops_tool.zsh --help
zsh scripts/ops_tool.zsh --status
zsh scripts/ops_tool.zsh --snapshot
zsh scripts/ops_tool.zsh --netcheck
zsh scripts/ops_tool.zsh --svccheck
zsh scripts/ops_tool.zsh --all
```

---

## Cron Automation

Runs `--all` checks every 30 minutes automatically:

```bash
*/30 * * * * zsh ~/lf_final_project/scripts/ops_tool.zsh --all >> ~/lf_final_project/logs/ops.log 2>&1
```

---

## Requirements

- Kali/Ubuntu Linux VM
- `zsh`
- `cron` / `crontab`
- Standard networking tools: `ip`, `ping`
- `apt` package manager

---

## Setup

```bash
mkdir -p ~/lf_final_project/{scripts,logs,reports}
chmod +x scripts/*.zsh
```

---

## Skills Demonstrated

- Linux system administration scripting
- Network and service health validation
- Cron-based automation and scheduled logging
- Argument parsing and exit code handling in Zsh
- Structured log-driven operations workflow
