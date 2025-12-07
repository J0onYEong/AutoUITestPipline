#!/bin/zsh

export PATH="/Users/choejun-yeong/.local/bin:$PATH"

echo "Current Shell: $SHELL"

which tuist

cd Junios

echo "#1. configure mise"
eval "$(mise activate)"
mise use tuist@4.90.0

echo "#2. Tuist install"
tuist install

echo "#3. Tuist generate"
tuist generate --no-open