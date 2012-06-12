# Pull in rbenv.
# (Add sharpsaw/ruby-dots and do ,rbenvi for quick install.)
[ -d ~/.rbenv ] && ...path-prepend ~/.rbenv/bin
type rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
