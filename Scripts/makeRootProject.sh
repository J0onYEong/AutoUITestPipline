#!/bin/zsh

source .zshrc

cd Junios

echo "[Mise] configuration"
eval "$(mise activate)"

echo "[Tuist] configuration"
mise use tuist@4.90.0

echo "[Tuist] Install xcode project dependencies"
tuist install

echo "[Tuist] Generate project"
tuist generate --no-open