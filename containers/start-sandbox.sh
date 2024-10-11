#!/bin/bash

# Wrapper around singularity shell showing how to launch work with a writable 
# sandbox.

PROJDIR=$HOME/Vis/projects/bowers-ic/
CLONESDIR=$PROJDIR/src

sudo singularity shell --writable \
      --mount type=bind,src=$CLONESDIR/manytestsr,dst=/mnt/manytestsr \
      --mount type=bind,src=$CLONESDIR/test_performance_sims,dst=/mnt/test_performance_sims \
      mysandbox/
