#!/bin/bash
set -m

randomize_time() {
  local hour=$((RANDOM % 8 + 16))
  local minute=$((RANDOM % 60))
  local second=$((RANDOM % 60))

  return "$hour:$minute:$second" $hour $minute $second
}

# Initial date
DATE='Tue Jul 4 19:41:32 2023'
function next_date {
  local day=$(echo $(date -d "$DATE +1 day" +%d) | sed 's/^0//')
  local time=$((RANDOM % 8 + 16)):$((RANDOM % 60)):$((RANDOM % 60))
  DATE=$(date -d "$DATE +1 day" '+%a %b '"$day $time"' %Y')

  # One-liner for testing in the terminal
  # DATE=$(date -d "$DATE  1DAY" '+%a %b '"$(echo $(date -d "$DATE +1 day" +%d) | sed 's/^0//') $(($RANDOM % 8 + 16)):$(($RANDOM % 60)):$(($RANDOM % 60))"' %Y')
  
  FULL_DATE="$DATE +0300"
}

function get_value {
  NONE=0
  SMALL=29
  MEDIUM=72
  LARGE=93

  value=0
  N=$((RANDOM % 100))

  if [ $N -ge $LARGE ] ; then
    value=$((RANDOM % 10 + 10))
  elif [ $N -ge $MEDIUM ] ; then
    value=$((RANDOM % 5 + 5))
  elif [ $N -ge $SMALL ] ; then
    value=$((RANDOM % 5))
  fi

  return $value
}