#!/bin/zsh

export PATH="/opt/homebrew/bin:$PATH"
eval "$(mise activate zsh)"

cd Junios

echo "[Tuist] configuration"
mise install

echo "[Tuist] Install xcode project dependencies"
mise exec tuist -- tuist install

echo "[Tuist] Generate project"
mise exec tuist -- tuist generate --no-open