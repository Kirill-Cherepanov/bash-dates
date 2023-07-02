#!/bin/bash
set -m

randomize_time() {
  local hour=$((RANDOM % 8 + 16))
  local minute=$((RANDOM % 60))
  local second=$((RANDOM % 60))

  return "$hour:$minute:$second" $hour $minute $second
}