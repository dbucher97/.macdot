#! /usr/bin/env sh

if [ -z "$1" ]; then 1="1"; fi

err=`yabai -m space --focus "$1" 2>&1`
rc=$?

# maybe better method by checking the focues space first with query

if [ "$rc" -ne "0" ] && [ "$err" != "cannot focus an already focused space." ]; then
  yabai -m space --create
  dsp=`yabai -m query --spaces | jq 'map(select(."has-focus" == true))[0].display'`
  sp=`yabai -m query --displays --display "$dsp" | jq '.spaces[-1]'`
  yabai -m space --focus "$sp" 2> /dev/null
fi
