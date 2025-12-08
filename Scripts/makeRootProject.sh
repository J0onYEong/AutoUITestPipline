#!/bin/zsh

export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$HOME/.local/share/mise/bin:$PATH"

cd Junios

echo "[Tuist] configuration"
mise use tuist@4.90.0

echo "[Tuist] Install xcode project dependencies"
tuist install

echo "[Tuist] Generate project"
tuist generate --no-open