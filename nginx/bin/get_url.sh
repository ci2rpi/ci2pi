#!/bin/bash

URL=$1
SLEEP_INTERVALL=$2

if [ "$URL" == "" ]; then
    echo "Usage: $0 URL [SLEEP_INTERVALL]"
    exit 1
fi

if [ "$SLEEP_INTERVALL" == "" ]; then
    SLEEP_INTERVALL=1
fi

while true; do
    response=$(wget -t 1 --timeout=1 -qO - $URL)
    if [ $? == 0 ]; then
        echo -n $response
        echo
    else 
        echo "fail!"
    fi
    sleep $SLEEP_INTERVALL
done
