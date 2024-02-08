#!/usr/bin/env bash

bb_is_installed() {
  if command -v bb > /dev/null; then
    return 0 # true
  else
    return 1 # false
  fi
}

bb_install() {
  sudo bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)
}
