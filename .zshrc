...filestart .zshrc
...sourcedircontents ~/.sh # Common with bash
fpath+=(~/.zsh/func); autoload -U ~/.zsh/func/*(:t)
...eachsource .zshrc
...sourcedircontents ~/.zsh/rc
...fileend .zshrc
