source ~/.../lib/assert-decent-shell || return

source ~/.../lib/basics

...sourcedircontents ~/.sh # Common with zsh
...sourcedircontents ~/.bash

# Get ~/.../src/your-dots/.bashrc, etc.
...quieteach ...sourceif .bashrc



# XXX
# The stuff below needs to be deprecated and eventually removed. I(ngy) am
# going to rework my setup to not need it. Then I'll try to see if anyone else
# is using it. Then we can comment it out for a while, then finally remove it.
# -- Ingy:18Jan2013

# Backwards compatibility:
source ~/.../lib/path-manip.sh
if [ -d ~/.bashrc.. ]; then
    sourceif ~/.bashrc../common
    sourceif ~/.bashrc../local
    sourceif ~/.bashrc../$USER
    [ -n "$LOCAL" ] && sourceif ~/.bashrc../$LOCAL
fi
