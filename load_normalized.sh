#!bin/sh
python3 -u load_tweets.py --db=postgresql://postgres:pass@localhost:3500/  --inputs "$1"
