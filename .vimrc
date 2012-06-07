call pathogen#infect()

" Loop over every ~/.../src/* repo and source their .vimrc
for dotdir in split(expand("$DOTDOTDOT_ORDER"), ' ')
    if -1 == match(dotdir, "etcet-dots")
      let s:vimrc = dotdir.'/.vimrc'
      if filereadable(s:vimrc)
        " echo "…sourcing" s:vimrc
          exec "source" s:vimrc
      end
    else
      " echo "…Skipping " dotdir
    end
endfor

fun! EnsureVamIsOnDisk(vam_install_path)
  if !filereadable(a:vam_install_path.'/vim-addon-manager/.git/config')
     \&& 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
    call mkdir(a:vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
    exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
  endif
endf

fun! SetupVAM()
  " Set advanced options like this:
  " let g:vim_addon_manager = {}
  " let g:vim_addon_manager['key'] = value
  " Hrm: ^ what is available?

  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  call EnsureVamIsOnDisk(vam_install_path)
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  let want = [
        \ 'github:kien/ctrlp.vim',
        \ ]
  " TODO:
  " let want += [ 'vim-addon-rdebug' ]
  " let want += [ 'vim-ruby-debugger' ]
  " let want += [ 'github:MarcWeber/vim-addon-ruby-debug-ide' ]
  call vam#ActivateAddons(want, {'auto_install' : 1})

  " How to find addon names?
  " - look up source from pool
  " - (<c-x><c-p> complete plugin names):
  " Also see section "2.2. names of addons and addon sources" in VAM's documentation
endfun
call SetupVAM()
