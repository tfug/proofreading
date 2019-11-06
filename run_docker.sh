#!/bin/bash

docker run \
  -it \
  --rm \
  -v $(PWD):/usr/local/documents \
  tfug/proofreading \
  /bin/ash ./run.sh ${1} ${2}
