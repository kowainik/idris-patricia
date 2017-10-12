#!/bin/bash

echo "Installing dependencies..."
mkdir -p dependencies/
cd dependencies/

echo "1: Specdris"
git clone https://github.com/pheymann/specdris.git
cd specdris
idris --build specdris.ipkg
cd ..

cd ..
