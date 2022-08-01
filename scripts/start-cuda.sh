#!/bin/bash
start=$(date +%s)
cd application || exit 1

echo "$(date +%T) - STARTING STARNET++"
echo "$(date +%T) - STRIDE=$STRIDE"

if [ "$PARALLEL" == true ]; then
    echo "$(date +%T) - PROCESSING IN PARALLEL NOT YET SUPPORTED"
    exit 1
else
    echo "$(date +%T) - PROCESSING IN SEQUENCE"
    for inputfile in /starnet/input/*.tif; do
        echo "PROCESSING: $inputfile"
        outputfile=${inputfile//input/output}
        ./starnet++ "$inputfile" "$outputfile" "$STRIDE"
    done
    echo "$(date +%T) - JOB COMPLETE"
fi

end=$(date +%s)

echo "Total Runtime: $((end-start))sec"