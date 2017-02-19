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

res=$(blkid -o export -s UUID -s LABEL -d |
while read line; do
  if [ ! -z "$line" ]; then
    eval "$(echo "$line" | sed "s/=/=\"/" | sed "s/$/\"/")"
  fi
  if [ ! -z "$UUID" ]; then
    write_array_el
  fi
done)

echo -e "[/]\nblacklist=[$res]" | dconf load /com/canonical/unity/devices/
