#!/usr/bin/env bash

HOSTNAME="$(hostname)"

log_info_template() {
  local -r filename="$1"
  printf "%s %s %s [%s] %s" "$(date -u +"%FT%T.%3NZ")" "${HOSTNAME}" "INFO" "${filename}" "%s"
}

log_error_template() {
  local -r filename="$1"
  printf "%s %s %s [%s] %s" "$(date -u +"%FT%T.%3NZ")" "${HOSTNAME}" "ERROR" "${filename}" "%s"
}
