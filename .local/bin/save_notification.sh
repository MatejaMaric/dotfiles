#!/usr/bin/env bash

# Some notifications have empty lines that we need to remove
appname=$(echo "$1" | sed  '/^$/d')
# Newline need to be converted to spaces
summary=$(echo "$2" | sed  '/^$/d' | tr $'\n' ' ')
body=$(echo "$3" | sed  '/^$/d' | tr $'\n' ' ')
icon=$(echo "$4" | sed  '/^$/d')
urgency=$(echo "$5" | sed  '/^$/d')
timestamp=$(date +"%I:%M %p")

touch /tmp/notifications
chmod 600 /tmp/notifications
echo -en "$timestamp\n$urgency\n$icon\n$body\n$summary\n$appname\n" >> /tmp/notifications
