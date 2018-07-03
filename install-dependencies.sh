#!/bin/bash

echo "Installing dependencies..."
mkdir -p dependencies/
cd dependencies/

echo "1: Specdris"
git clone https://github.com/pheymann/specdris.git
cd specdris
idris --install specdris.ipkg
cd ..

cd ..
