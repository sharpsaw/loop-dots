" You can disable installed vim plugins by putting them in this env var:
let g:pathogen_disabled = []
for disable in split(expand("$VIM_PATHOGEN_DISABLE"), ' ')
  call add(g:pathogen_disabled, disable)
endfor

call pathogen#infect()

" Loop over every ~/.../src/* repo and source their .vimrc
let loop_dots_verbose=0
for dotdir in split(expand("$DOTDOTDOT_ORDER"), ' ')
  if -1 == match(dotdir, "loop-dots")
    let s:vimrc = dotdir.'/.vimrc'
    if filereadable(s:vimrc)
      if loop_dots_verbose|echo "…sourcing" s:vimrc|end
      exec "source" s:vimrc
    else
      if loop_dots_verbose|echo "…missing" s:vimrc|end
    end
  else
    if loop_dots_verbose|echo "…skipping" dotdir|end
  end
endfor
