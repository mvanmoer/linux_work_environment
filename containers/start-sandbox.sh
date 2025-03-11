#!/bin/bash

# Wrapper around singularity shell showing how to launch work with a writable 
# sandbox.

PROJDIR=/projects/illinois/las/pol/jwbowers
CLONESDIR=$PROJDIR/mvanmoer/src
SANDBOX=$CLONESDIR/mvanmoer-bowers-sandbox

apptainer shell --fakeroot --writable \
      --mount type=bind,src=$CLONESDIR/manytestsr,dst=/mnt/manytestsr \
      --mount type=bind,src=$CLONESDIR/test_performance_sims,dst=/mnt/test_performance_sims \
      $SANDBOX
