# Apptainer Container Info

* minimal.def: Definition file to create a minimal container for running manytestsr and test_performance_sims
* bowers-prod-env.def: Definition file to replicate jwbowers full dev env, work-in-progress.

## Reproducibility

Apptainer containers are not strictly reproducible. This is because during build they include timestamps in some of the metadata. Therefore the SHA hashes will differ between each build. Beyond that, it is not guaranteed that system packages will always be the same version between builds, e.g., apt packages could be patched, etc. One safeguard is to bootstrap from a particular image hash and not from a tag such as :latest. 

One safeguard is to use exact package versions where possible, which this definition does by using the conda list -e output.

## Containers vs. Virtual Machines
Containers are like virtual environments++. They do not attempt to virtualize hardware resources. They will use the OS kernel from the host machine. They may bind certain paths depending on how they are launched and/or configured. Care has to be taken when building, testing, and running to make sure they aren't inadvertently relying on paths or env vars from the host.

Because they use the actual hardware and OS kernel from the host machine, this could affect scientific reproducibility.

It is considered best practice to share both the .def and the .sif. Currently, a .sif is available on the ICC in the project directory.

## Sandbox for Local Development
Containers aren't normally modifiable because they are often meant to replicate a set environment for reproducing on other resources. A compromise approach is to build a sandbox version of the container. Sandboxes can be built on the Illinois Campus Cluster on a login-node without root privileges provided one builds in `/tmp`.

`$ apptainer build --sandbox /tmp/<unique sandbox name> minimal.def`

or, more elaborately:

`$ time sudo apptainer build --sandbox /tmp/<unique sandbox name> minimal.def 2>&1 | tee build.out`

Instead of creating a .sif, this will make a directory `<unique sandbox name>/`. This can be `cd`'d into to look around, but shouldn't be modified directly. To use the sandbox, launch with `start-sandbox.sh` which is a wrapper around `sudo apptainer shell` which binds the manytestsr and test_performance_sims repos to `/mnt/manytestsr` and `/mnt/test_performance_sims`, respectively.

## Image File for Production

To build for production use, don't use `--sandbox`. The output will be a binary-blob `minimal.sif`.
