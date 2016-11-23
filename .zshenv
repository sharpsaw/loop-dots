[[ -z $already_looped_zshenvs ]] || return
already_looped_zshenvs=1

source ~/.ontic/lib/tracefuncs
...filestart .zshenv
source ~/.ontic/lib/basics
...eachsource .zshenv
...sourcedircontents ~/.zsh/env

# This is a hackish thing. zsh restores print_exit_value after function calls,
# so it's impossible to set it via anything above.
# setopt print_exit_value
