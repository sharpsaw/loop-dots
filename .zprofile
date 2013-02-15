[[ -z $already_looped_zprofile ]] || return
already_looped_zprofile=1

source ~/.../lib/tracefuncs
...filestart .zprofile
source ~/.../lib/scripting
...eachsource .zprofile
[ -d ~/.zsh/profile ] && ...sourcedircontents ~/.zsh/profile
...fileend .zprofile
