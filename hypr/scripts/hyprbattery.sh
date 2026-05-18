#!/bin/bash

LOW_SENT=0
CRITICAL_SENT=0
FULL80_SENT=0
FULL100_SENT=0

while true; do
  BAT=$(cat /sys/class/power_supply/BAT0/capacity)
  STATUS=$(cat /sys/class/power_supply/BAT0/status)

  # LOW BATTERY
  if [ "$BAT" -le 15 ] && [ "$LOW_SENT" -eq 0 ]; then
    notify-send "󰁺 Low Battery" "Battery at ${BAT}%"
    LOW_SENT=1
  fi

  # CRITICAL BATTERY
  if [ "$BAT" -le 5 ] && [ "$CRITICAL_SENT" -eq 0 ]; then
    notify-send "󰂃 Critical Battery" "Plug in charger immediately"
    CRITICAL_SENT=1
  fi

  # 80%
  if [ "$BAT" -ge 80 ] && [ "$STATUS" = "Charging" ] && [ "$FULL80_SENT" -eq 0 ]; then
    notify-send "󱈑 Battery" "Reached 80% — consider unplugging"
    FULL80_SENT=1
  fi

  # 100%
  if [ "$BAT" -eq 100 ] && [ "$STATUS" = "Charging" ] && [ "$FULL100_SENT" -eq 0 ]; then
    notify-send "󰂅 Battery Full" "Battery fully charged"
    FULL100_SENT=1
  fi

  # RESET FLAGS
  if [ "$BAT" -lt 75 ]; then
    FULL80_SENT=0
  fi

  if [ "$BAT" -lt 95 ]; then
    FULL100_SENT=0
  fi

  if [ "$BAT" -gt 20 ]; then
    LOW_SENT=0
    CRITICAL_SENT=0
  fi

  sleep 60
done
