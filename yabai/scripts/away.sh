#! /usr/bin/env sh

sp=`yabai -m query --spaces --space recent | jq 'if (.windows | length) == 0 then .display else 0 end'`
if [ "$sp" -ne "0" ]; then
  wc=`yabai -m query --displays --display $sp | jq '.spaces | length'`
  if [ "$wc" -gt "1" ]; then
    yabai -m space --destroy recent
  fi
fi
