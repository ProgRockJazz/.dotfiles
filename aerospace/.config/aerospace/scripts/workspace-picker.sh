#!/usr/bin/env bash
# Fuzzy-pick a workspace and switch to it.
# Requires: brew install wezterm fzf
set -e
list=$(mktemp -t aerospace-workspaces.XXXXXX)
result=$(mktemp -t aerospace-pick.XXXXXX)
trap 'rm -f "$list" "$result"' EXIT

aerospace list-workspaces --all > "$list"

wezterm --config-file "$HOME/.config/wezterm/picker.lua" start -- \
  bash -lc "fzf --prompt='workspace > ' --reverse < '$list' > '$result'"

sel=$(cat "$result")
[ -z "$sel" ] && exit 0
sleep 0.05  # cross-workspace switch reliability
aerospace workspace "$sel"
