#!/bin/bash
# setting up prerequisites

# re-runs will give an error that is harmless:

# https://github.com/mobz/elasticsearch-head/#running-as-a-plugin-of-elasticsearch
plugin install mobz/elasticsearch-head

#exec /docker-entrypoint.sh elasticsearch
exec elasticsearch -Des.insecure.allow.root=true
