#!/usr/bin/env bash

checkov_is_installed() {
  if command -v checkov > /dev/null; then
    return 0 # true
  else
    return 1 # false
  fi
}

checkov_install() {
  pip3 install checkov
}
