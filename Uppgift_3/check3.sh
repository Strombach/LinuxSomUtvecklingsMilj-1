#!/bin/bash

DIR="3D"
FILE="Makefile"
C_FILES=0

if [ -d "$DIR" ]; then
  cd "$DIR" || exit 1
  C_FILES=$(find ./*.c | wc -l)
else
  echo "No directory named '$DIR' found."
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "No $FILE found."
  exit 1
fi

function compileFiles(){
  local successCounter
  successCounter=0

  for f in ./*.c; do
    if gcc -c "$f"; then
      (( successCounter++ ))
    fi
  done

  if [ "$successCounter" -eq "$C_FILES" ]; then
    echo "All $C_FILES files are compilable."
  else
    echo "$(( "$C_FILES"-"$successCounter" )) file(s) failed."
  fi
}

function runMakeAll() {
  if make all ; then
    echo "'make all' ran successfully!"
  else
    echo "'make all' encountered an error"
  fi
}

function runMakeClean() {
  local oCounter
  oCounter=0
  if make clean ; then
    echo "'make clean' ran successfully!"
    for f in ./*.o; do
      if [ -f "$f" ]; then
      (( oCounter++ ))
      fi
    done

    if [ "$oCounter" -eq 0 ]; then
      echo "All .o-files were removed"
    else
      echo "Still $oCounter .o-files left"
    fi
  else
    echo "'make clean' encountered an error"
  fi
}

compileFiles
runMakeAll
runMakeClean

exit
