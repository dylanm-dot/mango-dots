#!/usr/bin/env bash
hyprpicker -r -z &
picker_pid=$!
sleep 0.1

geometry=$(slurp -d)
if [[ -z "$geometry" ]]; then
  kill "$picker_pid" 2>/dev/null
  exit 1
fi

file="$HOME/Pictures/Screenshots/$(date +%Y%m%d%H%M%S).png"
grim -g "$geometry" "$file"
wl-copy -t image/png < "$file"

kill "$picker_pid" 2>/dev/null
