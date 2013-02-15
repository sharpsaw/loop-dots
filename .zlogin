[[ -z $already_looped_zlogins ]] || return
already_looped_zlogins=1

source ~/.../lib/tracefuncs
...filestart .zlogin
source ~/.../lib/scripting
...eachsource .zlogin
...sourcedircontents ~/.zsh/login
...fileend .zlogin
