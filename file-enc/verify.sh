#!/bin/bash

REPO_TOP=$(git rev-parse --show-toplevel)
eval_dir="${REPO_TOP}/file-enc"
results_dir="${eval_dir}/results"
hashes_dir="${eval_dir}/hashes"

suffix=".full"
if [[ "$@" == *"--small"* ]]; then
    suffix=".small"
fi

cd $results_dir # md5sum computes paths relative to cd

if [[ "$@" == *"--generate"* ]]; then
    md5sum encrypt_files$suffix/* > $hashes_dir/encrypt_files$suffix.md5sum
    md5sum compress_files$suffix/* > $hashes_dir/compress_files$suffix.md5sum
fi

okay=0
if ! md5sum --check --quiet $hashes_dir/encrypt_files$suffix.md5sum; then
    okay=1
    echo "encrypt_files $suffix failed verification"
fi
if ! md5sum --check --quiet $hashes_dir/compress_files$suffix.md5sum; then
    okay=1
    echo "compress_files $suffix failed verification"
fi

exit $okay
