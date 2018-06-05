source ~/.../lib/assert-decent-shell || return
[[ -z $already_looped_bashrcs ]] || return
already_looped_bashrcs=1

source ~/.../lib/basics

...sourcedircontents ~/.sh # Common with zsh

if [ -d ~/.bash ]; then
  ...sourcedircontents ~/.bash
fi

# Get ~/.../src/your-dots/.bashrc, etc.
...eachsource .bashrc
