#!/bin/bash

REPO_TOP=$(git rev-parse --show-toplevel)
eval_dir="${REPO_TOP}/log-analysis"
input_dir="${eval_dir}/input"
scripts_dir="${eval_dir}/scripts"
hashes_dir="${eval_dir}/hashes"
results_dir="${eval_dir}/results"
mkdir -p $results_dir

#md5sum pcaps.full/* > /benchmarks/log-analysis/hashes/pcaps.full.md5sum
#md5sum nginx.full/* > /benchmarks/log-analysis/hashes/nginx.full.md5sum
#md5sum pcaps.small/* > /benchmarks/log-analysis/hashes/pcaps.small.md5sum
#md5sum nginx.small/* > /benchmarks/log-analysis/hashes/nginx.small.md5sum

suffix=".full"
if [[ "$@" == *"--small"* ]]; then
    suffix=".small"
fi

cd $results_dir # md5sum computes paths relative to cd
okay=0
if ! md5sum --check --quiet $hashes_dir/pcaps$suffix.md5sum; then
    okay=1
    echo "img_convert $suffix failed verification"
fi
if ! md5sum --check --quiet $hashes_dir/nginx$suffix.md5sum; then
    okay=1
    echo "to_mp3 $suffix failed verification"
fi

exit $okay
