# Singularity Container Info

NOTE: still under development.

bowers-dev-env.def is a Singularity definition file. It uses a base of Ubuntu 22.04 LTS and recreates the environment described in this repo.

## Reproducibility

Singularity containers are not strictly reproducible. This is because during build they include timestamps in some of the metadata. Therefore the SHA hashes will differ between each build. Beyond that, it is not guaranteed that system packages will always be the same version between builds, e.g., apt packages could be patched, etc. One safeguard is to bootstrap from a particular image hash and not from a tag such as :latest. 

One safeguard is to use exact package versions where possible, which this definition does by using the conda list -e output.

## Containers vs. Virtual Machines
Containers are like virtual environments++. They do not attempt to virtualize hardware resources. They will use the OS kernel from the host machine. They may bind certain paths depending on how they are launched and/or configured. Care has to be taken when building, testing, and running to make sure they aren't inadvertently relying on paths or env vars from the host.

Because they use the actual hardware and OS kernel from the host machine, this could affect scientific reproducibility.

It is considered best practice to share both the .def and the .sif. Currently, a .sif is available on the ICC in the project directory.

## TODOs
TODO: install onlineFDR
TODO: install nvimcom
TODO: default to ZSH instead of BASH
TODO: install Oh My Zsh
TODO: install Nerd Fonts
TODO: install kickstart.nvim
TODO: consider putting a signed sif on a repo like dockerhub
