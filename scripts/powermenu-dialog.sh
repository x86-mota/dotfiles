#!/usr/bin/env bash

IMAGE="${HOME}/.config/icons/logo.png"
TIMEOUT=60
LOGOUT_MSG="${USER} will be logged out automatically in ${TIMEOUT} seconds.\nAre you sure, proceed to logout?"
REBOOT_MSG="The system will reboot automatically in ${TIMEOUT} seconds.\nAre you sure, proceed to reboot?"
SHUTDOWN_MSG="The system will power off automatically in ${TIMEOUT} seconds.\nAre you sure, proceed to shutdown?"

function power_menu_dialog {
    local action=$1
    local action_name=$2
    local text=$3

    zenity --question \
        --title="${action_name}" \
        --icon="${IMAGE}" \
        --text="${text}" \
        --timeout=$TIMEOUT \
        --no-wrap \
        --default-cancel

    if [ $? -eq 1 ]; then
        exit 0
    fi

    if [ $? -eq 0 ] || [ $TIMEOUT -eq 0 ]; then
        $action
    fi
}

case "$1" in
    --shutdown)
        power_menu_dialog "systemctl poweroff" "Power Off" "${SHUTDOWN_MSG}"
        ;;
    --reboot)
        power_menu_dialog "systemctl reboot" "Restart" "${REBOOT_MSG}"
        ;;
    --logout)
        power_menu_dialog "hyprctl dispatch exit" "Log Out  ${USER}" "${LOGOUT_MSG}"
        ;;
    *)
        echo -e "Usage: $0 [OPTION]
        Options:
            --shutdown   Power off the system
            --reboot     Restart the system
            --logout     Log out the current user ($USER)
        Example usage:
            $0 --shutdown
            $0 --reboot
            $0 --logout
        "
        exit 1
        ;;
esac