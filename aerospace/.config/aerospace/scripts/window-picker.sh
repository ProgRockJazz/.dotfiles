#!/usr/bin/env bash
# Fuzzy-pick a window across all workspaces and focus it.
# Requires: brew install choose-gui (provides the `choose` binary)
set -e
sel=$(aerospace list-windows --all --format '%{window-id}  %{app-name}  %{window-title}' | choose)
[ -z "$sel" ] && exit 0
id=$(echo "$sel" | awk '{print $1}')
aerospace focus --window-id "$id"
