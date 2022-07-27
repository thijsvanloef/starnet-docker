#!/bin/bash

cd application || exit

echo "STARTING STARNET++"

for inputfile in ./input/*.tif; do
    echo "PROCESSING: $inputfile"
    outputfile=${inputfile//input/output}
    ./starnet++ "$inputfile" "$outputfile" 256
done
