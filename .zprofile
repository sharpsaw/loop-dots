[[ -z $already_looped_zprofile ]] || return
already_looped_zprofile=1

source ~/.ontic/lib/tracefuncs
...filestart .zprofile
source ~/.ontic/lib/scripting
...eachsource .zprofile
[ -d ~/.zsh/profile ] && ...sourcedircontents ~/.zsh/profile
...fileend .zprofile
