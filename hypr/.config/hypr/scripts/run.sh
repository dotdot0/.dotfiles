#!/usr/bin/bash

if [[ $1 == "firefox" ]]; then 
  firefox
elif [[ $1 == "spotify" ]]; then
  flatpak run com.spotify.Client
else
  echo "Invalid Arguments"
fi
