#!/bin/zsh

cd Junios

echo "#1. Activate mise"
mise activate

echo "#2. Tuist install"
tuist install

echo "#3. Tuist generate"
tuist generate