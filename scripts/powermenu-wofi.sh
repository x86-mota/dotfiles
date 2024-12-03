#!/usr/bin/env bash

CONFIG="$HOME/.config/wofi/powermenu/powermenu.conf"
STYLE="$HOME/.config/wofi/style.css"

op=$(echo -e "Lock  \nLogout \nReboot \nPoweroff ⏻" | wofi --dmenu --conf "${CONFIG}" --style "${STYLE}" | awk '{print tolower($2)}')

case $op in
    lock)
        hyprlock
        ;;
    logout)
        powermenu-dialog.sh --logout
        ;;
    reboot)
        powermenu-dialog.sh --reboot
        ;;
    poweroff)
        powermenu-dialog.sh --shutdown
        ;;
    *)
        exit 0
        ;;
esac
