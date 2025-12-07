#!/bin/zsh

export PATH="/Users/choejun-yeong/.local/bin:$PATH"

cd Junios

echo "#1. Activate mise"
eval "$(mise activate zsh)"

echo "#2. Tuist install"
tuist install

echo "#3. Tuist generate"
tuist generate