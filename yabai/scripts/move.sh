#! /usr/bin/env sh

if [ -z "$1" ]; then 1="1"; fi

yabai -m query --spaces --space "$1" &> /dev/null
rc=$?

if [ "$rc" -eq 0 ]; then
  [ `yabai -m query --spaces --space "$1" | jq '."has-focus"'` == "true" ] && exit 0
  yabai -m window --space "$1" && yabai -m space --focus "$1"
else
  yabai -m space --create
  dsp=`yabai -m query --spaces | jq 'map(select(."has-focus" == true))[0].display'`
  sp=`yabai -m query --displays --display "$dsp" | jq '.spaces[-1]'`
  yabai -m window --space "$sp" && yabai -m space --focus "$sp"
fi
