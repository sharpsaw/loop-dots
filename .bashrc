source ~/.../lib/basics

...sourcedircontents ~/.sh # Common with zsh
...sourcedircontents ~/.bash

# Get ~/.../src/your-dots/.bashrc, etc.
...quieteach ...sourceif .bashrc

# Backwards compatibility:
source ~/.../lib/path-manip.sh
sourceif ~/.bashrc../common
sourceif ~/.bashrc../local
sourceif ~/.bashrc../$USER
[ -n "$LOCAL" ] && sourceif ~/.bashrc../$LOCAL
