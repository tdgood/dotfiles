#!/usr/bin/env bash

# Check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
    echo "Error: 'stow' is not installed or not in your PATH."
    exit 1
fi

case "$1" in
    create)
        [ -d */ ] && stow --verbose --target=$HOME --restow */ || { echo "Error: No package directories found."; exit 1; }
        ;;
    delete)
        [ -d */ ] && stow --verbose --target=$HOME --delete */ || { echo "Error: No package directories found."; exit 1; }
        ;;
    *)
        echo "Usage: $0 [create|delete]"
        exit 1
        ;;
esac
