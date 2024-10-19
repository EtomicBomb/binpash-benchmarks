#!/bin/bash

REPO_TOP=$(git rev-parse --show-toplevel)
eval_dir="${REPO_TOP}/media-conv"
results_dir="${eval_dir}/results"
hashes_dir="${eval_dir}/hashes"

#md5sum img_convert.small/* > /benchmarks/media-conv/hashes/img_convert.small.md5sum
#md5sum to_mp3.small/* > /benchmarks/media-conv/hashes/to_mp3.small.md5sum
#md5sum img_convert.full/*  > /benchmarks/media-conv/hashes/img_convert.full.md5sum
#md5sum to_mp3.full/* > /benchmarks/media-conv/hashes/to_mp3.full.md5sum

suffix=".full"
if [[ "$@" == *"--small"* ]]; then
    suffix=".small"
fi

cd $results_dir # md5sum computes paths relative to cd
okay=0
if ! md5sum --check --quiet $hashes_dir/img_convert$suffix.md5sum; then
    okay=1
    echo "image_convert $suffix failed verification"
fi
if ! md5sum --check --quiet $hashes_dir/to_mp3$suffix.md5sum; then
    okay=1
    echo "to_mp3 $suffix failed verification"
fi

exit $okay
