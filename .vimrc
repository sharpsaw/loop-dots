call pathogen#infect()

fun! EnsureVamIsOnDisk(vam_install_path)
  if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
    call mkdir(a:vam_install_path, 'p')
    call system(
      \'git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
      \.shellescape(a:vam_install_path, 2).'/vim-addon-manager')
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
  endif
endf

let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
let g:vim_addon_manager = {
  \'shell_commands_run_method': 'system',
  \'auto_install': 1,
  \}
call EnsureVamIsOnDisk(vam_install_path)
exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

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
