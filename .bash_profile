[[ -z $already_looped_bash_profiles ]] || return
already_looped_bash_profiles=1

source ~/.../lib/basics
# Get ~/.../src/your-dots/.bash_profile, etc.
...eachsource .bash_profile

...sourceif ~/.bashrc
