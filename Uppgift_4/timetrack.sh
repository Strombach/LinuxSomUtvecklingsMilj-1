#!/bin/bash

PWD=$(pwd)
TIMETRACK=timeTrack
TIMETRACKPATH="$PWD/$TIMETRACK"
CURRENT_TIME=$(date +START_DATE=%d/%m/%Y%nSTART_TIME=%H:%M:%S)
CURRENT_POSIX=$(date +%s)

function main() {
  case "$1" in
    start)
      start
      ;;
    status)
      status
      ;;
    stop)
      stop
      ;;
    *)
      echo "Enter argument: start|status|stop"
      ;;
  esac    
}

function start() {
  if [ ! -f "$TIMETRACKPATH" ]; then
    touch "$TIMETRACKPATH"
  else
    readTimeTrack
  fi

  if [ ! "$ACTIVE" == true ]; then
  ACTIVE=true
    echo -e "$CURRENT_TIME\nACTIVE=$ACTIVE\nSTART_POSIX=$CURRENT_POSIX" > "$TIMETRACKPATH"
    echo "Timetrack started"
  else
    echo "Timetrack is already active"
  fi
}

function status() {
  if [ ! -f "$TIMETRACKPATH" ]; then
    echo "Timetrack is not active"
  else
    readTimeTrack
    if [ "$ACTIVE" == false ]; then
      echo "Timetrack is not active"
    else
      DIFF=$(($CURRENT_POSIX-$START_POSIX))
      echo "Seconds since start: $DIFF"
    fi
  fi
}

function stop() {
  if [ ! -f "$TIMETRACKPATH" ]; then
    echo "Timetrack is not active"
  else
    readTimeTrack
    if [ "$ACTIVE" == false ]; then
      echo "Timetrack is not active"
    else
      DIFF=$(($CURRENT_POSIX-$START_POSIX))
      ACTIVE=false
      echo -e "Timetrack stopped\nSeconds since start: $DIFF"
      echo -e "START_DATE=$START_DATE\nSTART_TIME=$START_TIME\nACTIVE=$ACTIVE\nSTART_POSIX=$START_POSIX" > "$TIMETRACKPATH"
    fi
  fi
}

function readTimeTrack() {
  source "$TIMETRACKPATH"
}

main "$1"

exit
