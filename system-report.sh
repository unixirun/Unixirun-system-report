#!/usr/bin/env bash
# Read-only system summary for macOS and Linux. Compatible with Bash 3.2+.
set -eu

usage() {
  printf 'Usage: bash system-report.sh [--save FILE | --help]\n'
}

report() {
  local os memory
  os=$(uname -s)
  case "$os" in
    Darwin)
      memory=$(sysctl -n hw.memsize | awk '{printf "%.1f GiB", $1/1073741824}')
      printf 'System: macOS %s\n' "$(sw_vers -productVersion)"
      ;;
    Linux)
      memory=$(awk '/^MemTotal:/ {printf "%.1f GiB", $2/1048576}' /proc/meminfo)
      printf 'System: Linux\n'
      ;;
    *) printf 'Unsupported system: %s\n' "$os" >&2; return 1 ;;
  esac
  printf 'Architecture: %s\n' "$(uname -m)"
  printf 'Kernel: %s\n' "$(uname -r)"
  printf 'Installed RAM (OS reported): %s\n' "$memory"
  # Strip the load-average suffix; do not print hostname, user, or IP.
  printf 'Uptime: '
  LC_ALL=C uptime | sed -E 's/.* up /up /; s/, *[0-9]+ users?.*//; s/, *load averages?:.*//'
  printf '\nRoot filesystem usage:\n'
  LC_ALL=C df -hP / | awk 'NR==1 {print "Size  Used  Available  Use%"} NR==2 {print $2, $3, $4, $5}'
}

if [ "$#" -eq 0 ]; then
  report
elif [ "$#" -eq 1 ] && [ "$1" = '--help' ]; then
  usage
elif [ "$#" -eq 2 ] && [ "$1" = '--save' ]; then
  # noclobber prevents accidental overwrites; quoted paths support spaces.
  (set -C; report > "$2") || { printf 'Could not save report (file may already exist).\n' >&2; exit 1; }
  printf 'Report saved: %s\n' "$2"
else
  usage >&2
  exit 2
fi
