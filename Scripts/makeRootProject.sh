#!/bin/bash

export PATH="/Users/choejun-yeong/.local/bin:$PATH"

cd Junios

echo "#1. configure mise"
eval "$(mise activate bash)"
mise use tuist@4.90.0

echo "#2. Tuist install"
tuist install

echo "#3. Tuist generate"
tuist generate --no-open