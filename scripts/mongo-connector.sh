#!/bin/bash

MONGO=`ping -c 1 mongo1 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
ES=`ping -c 1 elasticsearch | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`


pip install mongo-connector
pip install elastic-doc-manager
apt-get update && apt-get install -y curl
touch /scripts/mongo-connector-installed

printf "\n\nWaiting for MongoDB to start\n"
until curl http://${MONGO_URL}:28017/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
  printf '.'
  sleep 1
done
echo "MongoDB has started!"

echo "\n\nStarting mongo-connector.."
mongo-connector --auto-commit-interval=5 -m mongo1:27017 -t elasticsearch:9200 -v -d elastic_doc_manager --stdout
