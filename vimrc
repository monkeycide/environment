set background=dark
set cursorline
set nowrap
set number
set t_ut= " http://superuser.com/questions/399296/256-color-support-for-vim-background-in-tmux
          " http://sunaku.github.io/vim-256color-bce.html

syntax enable

" plugins, thank god
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'klen/python-mode'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'chase/vim-ansible-yaml'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'

" Add plugins to &runtimepath
call plug#end()

try
  colorscheme gruvbox
  let g:gruvbox_contrast=hard
catch
endtry

" CONFIGURE AIRLINE
set laststatus=2 " ensure airline visible before first split

" CONFIGURE FZF
function FuzzyFind()
  " Contains a null-byte that is stripped.
  let gitparent=system('git rev-parse --show-toplevel')[:-2]

  " search for .fzf files
  if empty(matchstr(gitparent, '^fatal:.*'))
    let fzf_marker_stop_dir=gitparent
  else
    let fzf_marker_stop_dir=''
  endif
  let fzf_marker=findfile('.fzf', '.;' . fzf_marker_stop_dir)

  " if a .fzf file exists, it overrides the git repo
  if !empty(fzf_marker)
    silent execute ':FZF ' . fnamemodify(fzf_marker, ':p:h')
  elseif empty(matchstr(gitparent, '^fatal:.*'))
    silent execute ':FZF ' . gitparent
  else
    silent execute ':FZF .'
  endif
endfunction

nmap <c-p> :call FuzzyFind()<cr>
