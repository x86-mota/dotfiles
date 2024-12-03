#!/usr/bin/env bash

IMAGE="${HOME}/.config/icons/logo.png"
TIMEOUT=60

zenity --question \
    --title="Power Off" \
    --icon="${IMAGE}" \
    --text="The system will power off automatically in ${TIMEOUT} seconds.\n
    Are you sure, proceed to shutdown?" \
    --timeout=$TIMEOUT \
    --no-wrap \
    --default-cancel 

    if [ $? -eq 1 ]; then
        exit 0
    fi

    if [ $? -eq 0 ] || [ $TIMEOUT -eq 0 ]; then
        systemctl poweroff
    fi