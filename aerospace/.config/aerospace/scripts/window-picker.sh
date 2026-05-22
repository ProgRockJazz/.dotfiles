#!/usr/bin/env bash
# Fuzzy-pick a window across all workspaces and focus it.
# Requires: brew install wezterm fzf
set -e
list=$(mktemp -t aerospace-windows.XXXXXX)
result=$(mktemp -t aerospace-pick.XXXXXX)
trap 'rm -f "$list" "$result"' EXIT

aerospace list-windows --all \
  --format '%{window-id}  %{app-name}  %{window-title}' > "$list"

wezterm --config-file "$HOME/.config/wezterm/picker.lua" start -- \
  bash -lc "fzf --prompt='window > ' --reverse < '$list' > '$result'"

sel=$(cat "$result")
[ -z "$sel" ] && exit 0
id=$(awk '{print $1}' <<< "$sel")
sleep 0.05  # workaround for AeroSpace#1371 cross-workspace focus quirk
aerospace focus --window-id "$id"
