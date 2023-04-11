#!/bin/bash

files=$(find data/*)

echo '================================================================================'
echo 'load denormalized'
echo '================================================================================'
time for file in $files; do
    bash load_denormalized.sh $file
done

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
time for file in $files; do
    python3 -u load_tweets.py --db=postgresql://postgres:pass@localhost:3500/ --inputs $file

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
#time python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:4500/ --inputs $files
