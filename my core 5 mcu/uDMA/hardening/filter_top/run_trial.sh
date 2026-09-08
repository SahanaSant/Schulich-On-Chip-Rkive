#!/usr/bin/env bash
# Invoke within the LibreLane Nix environment; examples are in README.md.
set -euo pipefail
trial="${1:?Usage: bash run_trial.sh TRIAL_NUMBER}"
case "$trial" in
  ''|*[!0-9]*) echo "Trial must be a positive integer" >&2; exit 2 ;;
esac
design_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$design_dir/config.trial_$trial.json"
tag="TRIAL_$trial"
test -f "$config"
if test -e "$design_dir/runs/$tag"; then
  echo "$tag already exists; preserve its evidence and use the next trial." >&2
  exit 2
fi
/usr/bin/time -v librelane --manual-pdk --pdk-root /home/sahana/.ciel \
  --jobs 2 --condensed --hide-progress-bar \
  --design-dir "$design_dir" --run-tag "$tag" "$config"
