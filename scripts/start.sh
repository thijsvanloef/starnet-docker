#!/bin/bash

cd application || exit

for inputfile in ./input/*.tif; do
    outputfile=${inputfile//input/output}
    ./starnet++ "$inputfile" "$outputfile" 256
done
