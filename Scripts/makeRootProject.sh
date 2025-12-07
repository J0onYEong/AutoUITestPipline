#!/bin/zsh

pwd
export PATH="$HOME/Users/choejun-yeong/.local/bin:$PATH"

cd Junios

echo "#1. Activate mise"
mise activate

echo "#2. Tuist install"
tuist install

echo "#3. Tuist generate"
tuist generate