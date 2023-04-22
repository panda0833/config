set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

if has('gui_running')
  " This will run if GVim is used
  colorscheme peachpuff
else
  " This will run if Vim is used in a terminal
  if &t_Co >= 256 || has('termguicolors')
    set termguicolors
    colorscheme default
  endif
endif

set tabstop=3
set expandtab
set backup
set backupdir=C:\temp
set backupskip=C:\temp
set directory=C:\temp
set undodir=C:\temp

set writebackup
set shiftwidth=3
set guifont=Lucida_Console:h9
set number
set nocompatible
set list!
set listchars=tab:\|·
set autoread

map <F2> f\r/
map <F3> :s!\n!! <ENTER>
map <F4> :w<CR>:sleep 100m<CR>:checktime<CR>i
map <F12> :checktime

hi SpecialKey ctermfg=7 guifg=grey
