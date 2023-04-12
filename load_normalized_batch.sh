#!bin/sh

python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:4500/ --inputs "$1"
