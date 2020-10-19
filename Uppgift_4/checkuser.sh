#!/bin/bash

USER_SEARCH="$1"

if [ "$#" -eq 0 ];then
  read -p "Enter a username to search for: " USER_SEARCH
fi

USER=$(users | grep "\b$USER_SEARCH\b" -o)

if [ -z "$USER" ]; then
  exit 0
else
  exit 1
fi
