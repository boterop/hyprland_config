#!/bin/bash

CHARGING="Charging"
DISCHARGING="Discharging"

LOW_SENT=0
CRITICAL_SENT=0
FULL80_SENT=0
FULL100_SENT=0

LAST_BAT=-1
LAST_STATUS="NONE"

while true; do
  BAT=$(cat /sys/class/power_supply/BAT0/capacity)
  STATUS=$(cat /sys/class/power_supply/BAT0/status)

  if [ "$BAT" -eq "$LAST_BAT" ] && [ "$STATUS" = "$LAST_STATUS" ]; then
    sleep 10
    continue
  fi

  LAST_BAT=$BAT
  LAST_STATUS=$STATUS

  # 100%
  if [ "$BAT" -eq 100 ] && [ "$STATUS" = "$CHARGING" ] && [ "$FULL100_SENT" -eq 0 ]; then
    notify-send "󰂅 Battery Full" "Battery fully charged"
    FULL100_SENT=1
  fi

  # 80%
  if [ "$BAT" -ge 80 ] && [ "$STATUS" = "$CHARGING" ] && [ "$FULL80_SENT" -eq 0 ]; then
    notify-send -t 0 "󱈑 Battery" "Reached 80% — consider unplugging"
    FULL80_SENT=1
  fi

  # LOW BATTERY
  if [ "$BAT" -le 15 ] && [ "$STATUS" = "$DISCHARGING" ] && [ "$LOW_SENT" -eq 0 ]; then
    notify-send "󰁺 Low Battery" "Battery at ${BAT}%"
    LOW_SENT=1
  fi

  # CRITICAL BATTERY
  if [ "$BAT" -le 5 ] && [ "$STATUS" = "$DISCHARGING" ] && [ "$CRITICAL_SENT" -eq 0 ]; then
    notify-send -t 0 "󰂃 Critical Battery" "Plug in charger immediately"
    CRITICAL_SENT=1
  fi

  # 3%
  if [ "$BAT" -le 3 ]; then
    notify-send "󰂃 Critical Battery" "Hibernating system"
    sleep 5
    systemctl hibernate
  fi

  # RESET FLAGS
  if [ "$BAT" -lt 95 ]; then
    FULL100_SENT=0
  fi

  if [ "$BAT" -lt 75 ]; then
    FULL80_SENT=0
  fi

  if [ "$BAT" -gt 20 ]; then
    LOW_SENT=0
  fi

  if [ "$BAT" -gt 15 ]; then
    CRITICAL_SENT=0
  fi

  sleep 60
done
