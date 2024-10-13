#!/bin/bash

REPO_TOP=$(git rev-parse --show-toplevel)

eval_dir="${REPO_TOP}/media-conv"
results_dir="${eval_dir}/results"
scripts_dir="${eval_dir}/scripts"
input_dir="${eval_dir}/input"

wget https://atlas-group.cs.brown.edu/data/wav.zip -O $input_dir/wav.zip
unzip wav.zip -d wav_full

JPG_DATA_LINK=https://atlas-group.cs.brown.edu/data/full/jpg.zip
wget $JPG_DATA_LINK -O jpg_full.zip
unzip jpg_full.zip -d jpg_full
echo "JPG Generated"
rm jpg_full.zip

JPG_DATA_LINK=https://atlas-group.cs.brown.edu/data/small/jpg.zip
wget $JPG_DATA_LINK -O jpg_small.zip
unzip jpg_small.zip -d jpg_small
echo "JPG_small Generated"
rm jpg_small.zip
