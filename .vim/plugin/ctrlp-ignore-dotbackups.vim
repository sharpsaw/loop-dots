" Also ignores .../backup/* - see: http://kien.github.com/ctrlp.vim/
let g:ctrlp_custom_ignore = {
  \ 'dir':  '/backups$\|\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
