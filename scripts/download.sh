#!/bin/bash

mkdir -p data/raw

curl -L "https://www.tennisabstract.com/jsmatches/SerenaWilliamsCareer.js" \
    -o data/raw/SerenaWilliamsCareer.js