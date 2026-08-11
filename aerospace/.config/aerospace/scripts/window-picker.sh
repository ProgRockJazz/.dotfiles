#!/usr/bin/env bash
# Fuzzy-pick a window across all workspaces and focus it.
# Requires: brew install wezterm fzf
set -e
list=$(mktemp -t aerospace-windows.XXXXXX)
result=$(mktemp -t aerospace-pick.XXXXXX)
trap 'rm -f "$list" "$result"' EXIT
existing_picker_ids=$(aerospace list-windows --all \
  --app-bundle-id com.github.wez.wezterm \
  --format '%{window-id}' 2>/dev/null || true)

focus_picker_window() {
  local current_ids picker_id candidate
  for _ in 1 2 3 4 5; do
    sleep 0.05
    current_ids=$(aerospace list-windows --all \
      --app-bundle-id com.github.wez.wezterm \
      --format '%{window-id}' 2>/dev/null || true)
    while IFS= read -r candidate; do
      [ -z "$candidate" ] && continue
      if ! grep -Fxq "$candidate" <<< "$existing_picker_ids"; then
        picker_id=$candidate
      fi
    done <<< "$current_ids"
    if [ -n "$picker_id" ]; then
      aerospace focus --window-id "$picker_id" >/dev/null 2>&1 || true
      return
    fi
  done
}

aerospace list-windows --all \
  --format '%{window-id}  %{app-name}  %{window-title}' > "$list"

# Best-effort focus nudge while the picker window is open.
focus_picker_window &
wezterm --config-file "$HOME/.config/wezterm/picker.lua" start -- \
  bash -lc "fzf --prompt='window > ' --reverse < '$list' > '$result'"

sel=$(cat "$result")
[ -z "$sel" ] && exit 0
id=$(awk '{print $1}' <<< "$sel")
sleep 0.05  # workaround for AeroSpace#1371 cross-workspace focus quirk
aerospace focus --window-id "$id"
