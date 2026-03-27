#!/usr/bin/fish

# 1. Cambiamos al workspace 1 usando swaymsg
swaymsg workspace "1: Chrome " 

# 2. Contamos las ventanas en el workspace actual ("1")
# En Sway, la estructura del JSON es ligeramente diferente a i3
set window_count (swaymsg -t get_tree | jq '[.. | select(.type? == "workspace" and .name? == "1: Chrome ") | .nodes[]] | length')

# 3. Si el workspace está vacío (0 ventanas), abrimos Chrome
if test "$window_count" = "0"
    google-chrome-stable &
end
