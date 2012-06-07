# See notes in .zshenv for the full sequence
source $DOTDOTDOT_ROOT/lib/scripting
...sourcedircontents ~/.sh # Common with bash
...quieteach ...sourceif .zshrc
...sourcedircontents ~/.zsh/rc
