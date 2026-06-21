#!/usr/bin/env bash

# Toggle between extended dual-monitor mode and mirror mode in Sway using wl-mirror

if ! command -v wl-mirror &> /dev/null; then
    notify-send -u critical "Sway Mirror" "wl-mirror no está instalado.\nInstálalo ejecutando: sudo dnf install wl-mirror"
    exit 1
fi

# If wl-mirror is currently running, kill it to return to normal/extended mode
if pgrep -x "wl-mirror" > /dev/null; then
    pkill -x "wl-mirror"
    notify-send -i video-display "Pantallas" "Modo extendido activado"
    exit 0
fi

# Get list of active outputs
OUTPUTS=($(swaymsg -t get_outputs -r | jq -r '.[] | select(.active) | .name'))
OUTPUT_COUNT=${#OUTPUTS[@]}

if [ "$OUTPUT_COUNT" -lt 2 ]; then
    notify-send -u low -i video-display "Pantallas" "Solo hay un monitor activo conectado"
    exit 0
fi

# Determine source (primary/focused) and target (external) display
FOCUSED=$(swaymsg -t get_outputs -r | jq -r '.[] | select(.focused) | .name')

SOURCE=""
if [ -n "$FOCUSED" ] && [ "$FOCUSED" != "null" ]; then
    SOURCE="$FOCUSED"
else
    SOURCE="${OUTPUTS[0]}"
fi

# Target is the first active output that is not the source
TARGET=""
for OUT in "${OUTPUTS[@]}"; do
    if [ "$OUT" != "$SOURCE" ]; then
        TARGET="$OUT"
        break
    fi
done

if [ -z "$TARGET" ]; then
    TARGET="${OUTPUTS[1]}"
fi

notify-send -i video-display "Pantallas" "Modo espejo (mirror) activado:\n$SOURCE -> $TARGET"

# Start wl-mirror fullscreen on target output
wl-mirror --fullscreen-output "$TARGET" "$SOURCE" &
