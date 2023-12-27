#!/bin/bash
STATUS=$(sudo systemctl is-active bluetooth)
if [[ "$STATUS" == "active" ]]; then
  echo "Bluetooth is $STATUS, disable it? (y/n)"
  read INPUT
  if [[ "$INPUT" == "y" ]]; then
    sudo systemctl stop bluetooth
    echo "Bluetooth is now OFF"
    sleep 2s
  fi
else
  echo "Bluetooth is $STATUS, enable it? (y/n)"
  read INPUT
  if [[ "$INPUT" == "y" ]]; then
    sudo systemctl start bluetooth
    echo "Bluetooth is now ON"
    sleep 2s
  fi
fi
