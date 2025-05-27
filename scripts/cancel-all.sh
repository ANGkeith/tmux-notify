#!/usr/bin/env bash
## -- Cancel monitoring script
# Used to cancel all monitor jobs

# Get current directory
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Source helpers and variables
source "${CURRENT_DIR}/helpers.sh"
source "${CURRENT_DIR}/variables.sh"


for f in "$PID_DIR"/*; do
  if [[ -f $f ]]; then
    # Retrieve monitor process PID
    PID=$(cat "$f")

    # Kill process and remove pid file
    kill "$PID" || true
    rm "$f"
  else
    tmux display-message "No more monitors to clear"
    exit 0
  fi
done

tmux display-message "Cleared all monitors"
