source $DOTDOTDOT_ROOT/lib/basics

# Common with zsh:
...sourcedircontents ~/.sh

...sourcedircontents ~/.bash

# Get ~/.../src/your-dots/.bashrc, etc.
...quieteach ...sourceif .bashrc

# Backwards compatibility:
source ~/.../lib/path-manip.sh
sourceif ~/.bashrc../common
sourceif ~/.bashrc../local
sourceif ~/.bashrc../$USER
[ -n "$LOCAL" ] && sourceif ~/.bashrc../$LOCAL
