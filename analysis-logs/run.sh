#!/bin/bash

REPO_TOP=$(git rev-parse --show-toplevel)

eval_dir="${REPO_TOP}/analysis-logs"
results_dir="${eval_dir}/results"
scripts_dir="${eval_dir}/scripts"
input_dir="${eval_dir}/input"
mkdir -p $results_dir

export INPUT=${input_dir}/access.log

$scripts_dir/nginx.sh > "$results_dir/$(basename "$script").out"
