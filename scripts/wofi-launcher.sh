#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/wofi.conf"
STYLE="$HOME/.config/wofi/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi -show drun --allow-images --no-actions --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi