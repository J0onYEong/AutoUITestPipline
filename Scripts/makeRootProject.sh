#!/bin/zsh

export PATH="/opt/homebrew/bin:$PATH"
eval "$(mise activate zsh)"

cd Junios

echo "[Tuist] configuration"
mise use tuist@4.90.0

echo "[Tuist] Install xcode project dependencies"
mise exec tuist install

echo "[Tuist] Generate project"
mise exec tuist generate --no-open