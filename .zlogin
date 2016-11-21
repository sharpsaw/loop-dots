[[ -z $already_looped_zlogins ]] || return
already_looped_zlogins=1

source ~/.ontic/lib/tracefuncs
...filestart .zlogin
source ~/.ontic/lib/scripting
...eachsource .zlogin
...sourcedircontents ~/.zsh/login
...fileend .zlogin
