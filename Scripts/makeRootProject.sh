#!/bin/zsh

export PATH="/Users/choejun-yeong/.local/bin:$PATH"

echo "Current Shell: $SHELL"

cd Junios

echo "#1. configure mise"
eval "$(mise activate)"

mise install tuist@4.90.0

mise use tuist@4.90.0

which tuist

echo "#2. Tuist install"
tuist install

echo "#3. Tuist generate"
tuist generate --no-open