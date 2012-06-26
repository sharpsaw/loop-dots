source ~/.../lib/tracefuncs
...filestart .zshenv
source ~/.../lib/basics
...eachsource .zshenv
...sourcedircontents ~/.zsh/env

# This is a hackish thing. zsh restores print_exit_value after function calls,
# so it's impossible to set it via anything above.
setopt print_exit_value

# Pull in rbenv.
# (Add sharpsaw/ruby-dots and do ,rbenvi for quick install.)
[ -d ~/.rbenv ] && ...path-prepend ~/.rbenv/shims/
type rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
...fileend .zshenv
