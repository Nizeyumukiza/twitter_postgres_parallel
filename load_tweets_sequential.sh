#!/bin/bash

files=$(find data/*)

echo '================================================================================'
echo 'load denormalized'
echo '================================================================================'
time for file in $files; do
    unzip -p  $file | sed 's/\\u0000//g' | psql postgresql://postgres:pass@localhost:2500/ -c "COPY tweets_jsonb (data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"
done

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
time for file in $files; do
    bash load_normalized.sh $file
done

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
#time for file in $files; do
 #   bash load_normalized_batch.sh $file
#done 
