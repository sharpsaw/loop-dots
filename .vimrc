call pathogen#infect()

fun! EnsureVamIsOnDisk(vam_install_path)
  if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
     \&& 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
    call mkdir(a:vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
      \ .shellescape(a:vam_install_path, 1).'/vim-addon-manager'
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
  endif
endf

let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
call EnsureVamIsOnDisk(vam_install_path)
exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

" Loop over every ~/.../src/* repo and source their .vimrc
for dotdir in split(expand("$DOTDOTDOT_ORDER"), ' ')
    if -1 == match(dotdir, "loop-dots")
      let s:vimrc = dotdir.'/.vimrc'
      if filereadable(s:vimrc)
        " echo "…sourcing" s:vimrc
          exec "source" s:vimrc
      end
    else
      " echo "…Skipping " dotdir
    end
endfor

