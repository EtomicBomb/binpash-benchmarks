#!/bin/bash

source ../PARAMS.sh

samples=(
    "mmu.dRNASeq.inclSIRV.PRJEB27590.ERR2680375.1"
    "mmu.dRNASeq.inclSIRV.PRJEB27590.ERR2680379.1"
    "mmu.dRNASeq.inclSIRV.PRJEB27590.ERR3363657.1"
    "mmu.dRNASeq.inclSIRV.PRJEB27590.ERR3363659.1"
)

for f in "${samples[@]}"; do
    sdir="$SAMPLE_DIR/$f"
    for g in $(find "$sdir"); do
        if [ -f "$g" ]
        then
            echo -n "$g: "
            if [[ "$g" == *.gz ]]
            then
                zcat "$g" | sha256sum
            elif [[ "$g" == *.db ]]
            then
                sqlite3 "$g" "SELECT * FROM genome transcr" | sha256sum
	    elif [[ "$g" == *logfiles/cutadapt*.log ]]
	    then
		grep -v "Finished in " "$g" | sha256sum
	    elif [[ "$g" == *logfiles/star*.log ]]
	    then
		cat "$g" | cut -d' ' -f5- | sha256sum
            else
                sha256sum < "$g"
            fi
        fi
    done
done

