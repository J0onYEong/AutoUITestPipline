#!/bin/zsh

export PATH="$HOME/.local/bin:$HOME/.local/share/mise/shims:$HOME/.local/share/mise/bin:$PATH"

which mise

cd Junios

echo "[Tuist] configuration"
mise use tuist@4.90.0

echo "[Tuist] Install xcode project dependencies"
mise exec tuist install

echo "[Tuist] Generate project"
mise exec tuist generate --no-open