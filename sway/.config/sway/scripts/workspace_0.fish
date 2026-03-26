#!/usr/bin/fish

# 1. Cambiamos al workspace 1 usando swaymsg
swaymsg workspace "10: Music"

# 2. Contamos las ventanas en el workspace actual ("1")
# En Sway, la estructura del JSON es ligeramente diferente a i3
set window_count (swaymsg -t get_tree | jq '[.. | select(.type? == "workspace" and .name? == "10: Music") | .nodes[]] | length')

# 3. Si el workspace está vacío (0 ventanas), abrimos Chrome
if test "$window_count" = "0"
    google-chrome-stable --app=https://music.youtube.com &
end
