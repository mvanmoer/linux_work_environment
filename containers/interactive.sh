#!/bin/bash

# This is a wrapper around srun for serial jobs. Once the job is launched,
# cd to where the sif is and run:
#
# $ singularity shell <name-of-sif>
#
# sif location: /projects/illinois/las/pol/jwbowers/bowers-dev-enf.sif

# The campus cluster is currently going through rolling upgrades. As nodes
# drain, the patches get applied and then they're rebooted. This could take
# quite a while to finish. In the meantime, using sinfo, I was able to 
# deduce and verify a node which had been rebooted recently enough. 
# The --nodelist option should be removed once the updates are complete.

module load singularity/3.8.5

srun \
  --nodelist=ccc0107 \
  -A jwbowers-ic \
  --partition=IllinoisComputes \
  --time=00:30:00 \
  --nodes=1 \
  --ntasks-per-node=1 \
  --pty /bin/bash

