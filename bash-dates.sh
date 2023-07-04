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

function get_amount {
  NONE=0
  SMALL=29
  MEDIUM=72
  LARGE=93

  AMOUNT=0
  N=$((RANDOM % 100))

  if [ $N -ge $LARGE ] ; then
    AMOUNT=$((RANDOM % 10 + 10))
  elif [ $N -ge $MEDIUM ] ; then
    AMOUNT=$((RANDOM % 5 + 5))
  elif [ $N -ge $SMALL ] ; then
    AMOUNT=$((RANDOM % 5))
  fi

  return $AMOUNT
}

AMOUNT=0
for VALUE in {1..100}
do
  if [ $AMOUNT = 0 ] ; then
    next_date
    get_amount
    echo "Commits: $AMOUNT"
  fi

  if [ $AMOUNT != 0 ] ; then
    AMOUNT=$((AMOUNT - 1))
    echo $FULL_DATE
  fi
done