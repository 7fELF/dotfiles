#!/bin/bash

function write_array_el {
  if [ -z "$first" ]; then
    first=0
  else
    echo -n ","
  fi
  echo -n \'"$UUID"-"$LABEL"\'
  unset UUID LABEL
}

function generate_devices_list {
  sudo blkid -o export -s UUID -s LABEL -d |
  while read line; do
    if [ ! -z "$line" ]; then
      eval "$(echo "$line" | sed "s/=/=\"/" | sed "s/$/\"/")"
    fi
    if [ ! -z "$UUID" ]; then
      write_array_el
    fi
  done
}

list=$(generate_devices_list)
dconf reset -f /com/canonical/unity/devices/
echo -e "[/]\nblacklist=[$list]" | dconf load /com/canonical/unity/devices/
