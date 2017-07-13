call plug#begin('~/.vim/plugged')
Plug 'munshkr/vim-tidal'
Plug 'vim-scripts/closetag.vim'
Plug 'keith/swift.vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'othree/html5.vim'
Plug 'ElmCast/elm-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sophacles/vim-processing'
Plug 'neovimhaskell/haskell-vim'
Plug 'commercialhaskell/hindent'
Plug 'alx741/vim-hindent'
Plug 'airodactyl/neovim-ranger'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'arakashic/chromatica.nvim'
Plug 'eagletmt/neco-ghc'
Plug 'timeyyy/orchestra.nvim'
call plug#end()

" neovim shit
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Toggle absolute and relative numbering in VIM by insert/normal mode
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

let mapleader = ','
set smarttab
set ruler
set autoindent
set smartindent
set expandtab
set relativenumber
set textwidth=80
set tw=80
set wrap
set wrap linebreak nolist
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set cursorline

colorscheme spacemacs-theme
set background=dark

" nerd commenter ------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = {
    \ 'haskell': { 'leftAlt': '{-','rightAlt': '-}', 'left': '-- ', 'right': '' },
\ }

" haskell-vim ------------------------------------------------------------------
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Use deoplete. ------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" chromatica ------------------------------------------------------------------
let g:chromatica#libclang_path='/usr/local/Cellar/llvm/4.0.1/lib/libclang.dylib'
let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
