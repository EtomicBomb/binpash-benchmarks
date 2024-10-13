#!/bin/bash

REPO_TOP=$(git rev-parse --show-toplevel)

eval_dir="${REPO_TOP}/analysis-pcap"
results_dir="${eval_dir}/results"
hashes_dir="${eval_dir}/hashes"

if [ "$(md5sum $results_dir/* | awk '{print $1}')" == "$(cat $hashes_dir/checksum.md5 | awk '{print $1}')" ];
then
    echo "Valid"
else
    echo "Invalid"
    exit 1
fi
