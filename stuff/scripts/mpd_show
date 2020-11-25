#!/bin/sh

raw="$(mpc)"
song=$(echo "$raw" | sed -n '1p')
time=$(echo "$raw" | sed -n '2p')
notify-send "$song" "$time"
