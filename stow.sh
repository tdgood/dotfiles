#!/usr/bin/env bash

if ! command -v stow >/dev/null 2>&1; then
    echo "Error: 'stow' is not installed or not in your PATH."
    exit 1
fi

cd "$(dirname "$0")" || {
    echo "Error: Failed to change to stow directory"
    exit 1
}

shopt -s nullglob

case "$1" in
create)
    stow --verbose --target="$HOME" --restow */
    ;;
delete)
    stow --verbose --target="$HOME" --delete */
    ;;
*)
    echo "Usage: $0 [create|delete]"
    exit 1
    ;;
esac
