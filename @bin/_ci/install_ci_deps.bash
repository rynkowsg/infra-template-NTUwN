#!/bin/bash

# helper variables used for resolving relative paths
SCRIPT_PATH="$([ -L "$0" ] && readlink "$0" || echo "$0")"
SCRIPT_DIR="$(cd "$(dirname "${SCRIPT_PATH}")" || exit 1; pwd -P)"
BIN_ROOT_DIR="$(cd "${SCRIPT_DIR}/.." || exit 1; pwd -P)"

## imports

source "${BIN_ROOT_DIR}/bash/bb.bash" # bb_is_installed, bb_install
source "${BIN_ROOT_DIR}/bash/checkov.bash" # checkov_is_installed, checkov_install
source "${BIN_ROOT_DIR}/bash/log.bash" # log, logf

## log

FILENAME="$(basename "${SCRIPT_PATH}")"
# shellcheck disable=SC2059
log_info() { printf "$(log_info_template "${FILENAME}")\n" "$1"; }
# shellcheck disable=SC2059
log_error() { printf "$(log_error_template "${FILENAME}")\n" "$1"; }

# bb

bb_ensure_installed() {
  # install when not installed
  if ! bb_is_installed; then
    log_info "Babashka not installed."
    log_info "Babashka installing..."
    bb_install
    log_info "Babashka installing... DONE"
  else
    log_info "Babashka has been found"
  fi
  # report issue when still not installed
  if ! bb_is_installed; then
    log_error "Failed to install babashka."
    exit 1
  fi
}

checkov_ensure_installed() {
  # install when not installed
  if ! checkov_is_installed; then
    log_info "checkov not installed."
    log_info "checkov installing..."
    checkov_install
    log_info "checkov installing... DONE"
  else
    log_info "checkov has been found"
  fi
  # report issue when still not installed
  if ! checkov_is_installed; then
    log_error "Failed to install checkov."
    exit 1
  fi
}

# main

main() {
#  bb_ensure_installed
#  checkov_ensure_installed
  echo "do nothing"
}

main "$@"
