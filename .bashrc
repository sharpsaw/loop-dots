source ~/.../lib/assert-decent-shell || return
[[ -z $already_looped_bashrcs ]] || return
already_looped_bashrcs=1

source ~/.../lib/basics

...sourcedircontents ~/.sh # Common with zsh
...sourcedircontents ~/.bash

# Get ~/.../src/your-dots/.bashrc, etc.
...eachsource .bashrc
