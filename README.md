# Our Linux Work Environment

A repository with information about current packages and software we use on
linux clusters and workstations.

The key files are here with conda packages and R packages. We are not currently
relying much on python. We have C++ code to compile within R packages.

## Interactive Mode

They key pieces for interactive development (and bug squashing) for me are
neovim, tmux, htop, ripgrep.


### Editor

For interactive work I tend to use
[neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md) installed via
AppImage because conda only has old versions. This is done by hand and requires
changing the path in .zshrc:

```
export PATH=$HOME/usr/bin:$PATH
```
And I use a fork of the
[kickstart.nvim](https://github.com/jwbowers/kickstart.nvim) set of plugins to
make neovim understand R and LaTeX etc.

### Zsh

I use zsh and the oh my zsh system:

```
export ZSH="$HOME/.oh-my-zsh"
```

# To Use on the Campus Cluster

To test, on the campus cluster cd to `/projects/illinois/las/pol/jwbowers` and run `interactive.sh`. This is a wrapper around an srun call to get on a particular node (see note about why inside script.) Once the interactive job is launched, do
```
$ singularity shell <name-of-sif>
```
which should put you in a container. Note that the mambaR env will not be indicated in the prompt, but it is active.


