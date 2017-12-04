call plug#begin('~/.vim/plugged')
Plug 'neovimhaskell/haskell-vim'
Plug 'munshkr/vim-tidal'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'othree/html5.vim'
Plug 'ElmCast/elm-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'sophacles/vim-processing'
Plug 'airodactyl/neovim-ranger'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'pbogut/deoplete-elm'
Plug 'w0rp/ale'
Plug 'dag/vim-fish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/loremipsum'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'skywind3000/asyncrun.vim'
Plug 'Twinside/vim-hoogle'
Plug 'owickstrom/vim-colors-paramount'
Plug 'tpope/vim-haml'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-surround'
Plug 'tikhomirov/vim-glsl'
Plug 'srstevenson/vim-picker'
Plug 'eagletmt/neco-ghc'
Plug 'mitsuse/autocomplete-swift'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format' 
Plug 'chriskempson/base16-vim'
call plug#end()

" if &shell =~# 'fish$'
  " set shell=sh
" endif

set nocompatible
colorscheme paramount
" colorscheme base16-grayscale-dark
let base16colorspace=256
set background=dark
set termguicolors
syntax on
filetype plugin indent on

" neovim shit
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Toggle absolute and relative numbering in VIM by insert/normal mode
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber



let mapleader = ','
" set foldmethod=syntax
set smarttab
set mouse=a
set equalalways
set ruler
set autoindent
set smartindent
set clipboard=unnamed
set completeopt-=preview
set expandtab
set relativenumber
set textwidth=80
set tw=80
set wrap linebreak nolist
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start
set cursorline
set laststatus=2
set wildmenu
set hidden
set ignorecase
set nostartofline
set scrolloff=999

" haskell vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_if = 4
let g:haskell_indent_where = 4
let g:haskell_indent_do = 4
let g:haskell_indent_guard = 4

" nerd commenter --------------------------------------------------------------
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

" vim-airline" ------------------------------------------------------------------
let g:airline_theme='base16_grayscale'

augroup vimrc
  " Auto rebuild C/C++ project when source file is updated, asynchronously
  autocmd BufWritePost *.c,*.cpp,*.h
              \ let dir=expand('<amatch>:p:h') |
              \ if filereadable(dir.'/Makefile') || filereadable(dir.'/makefile') |
              \   execute 'AsyncRun -cwd=<root> make -j8' |
              \ endif
  " Auto toggle the quickfix window
  autocmd User AsyncRunStop
              \ if g:asyncrun_status=='failure' |
              \   execute('call asyncrun#quickfix_toggle(8, 1)') |
              \ else |
              \   execute('call asyncrun#quickfix_toggle(8, 0)') |
              \ endif
augroup END

" Define new accents
function! AirlineThemePatch(palette)
  " [ guifg, guibg, ctermfg, ctermbg, opts ].
  " See "help attr-list" for valid values for the "opt" value.
  " http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
  let a:palette.accents.running = [ '', '', '', '', '' ]
  let a:palette.accents.success = [ '#00ff00', '' , 'green', '', '' ]
  let a:palette.accents.failure = [ '#ff0000', '' , 'red', '', '' ]
endfunction
let g:airline_theme_patch_func = 'AirlineThemePatch'


" Change color of the relevant section according to g:asyncrun_status, a global variable exposed by AsyncRun
" 'running': default, 'success': green, 'failure': red
let g:async_status_old = ''
function! Get_asyncrun_running()

  let async_status = g:asyncrun_status
  if async_status != g:async_status_old

    if async_status == 'running'
      call airline#parts#define_accent('asyncrun_status', 'running')
    elseif async_status == 'success'
      call airline#parts#define_accent('asyncrun_status', 'success')
    elseif async_status == 'failure'
      call airline#parts#define_accent('asyncrun_status', 'failure')
    endif

    let g:airline_section_x = airline#section#create(['asyncrun_status'])
    AirlineRefresh
    let g:async_status_old = async_status

  endif

  return async_status

endfunction

call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
let g:airline_section_x = airline#section#create(['asyncrun_status'])

" Human readable Line number (with thousands separators)
function! MyLineNumber()
  return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
    \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
endfunction

call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})

let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

" ale ---------------------------------------------------------------------------
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'normal'

" Use deoplete. ----------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" elm-vim ----------------------------------------------------------------------
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" haskell-vim ------------------------------------------------------------------
let g:haskell_indent_do = 4
let g:haskell_indent_guard = 4
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_where = 4
let g:haskell_indent_after_bare_where = 4

" vim-closetag -----------------------------------------------------------------
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" emmet 
let g:user_emmet_install_global = 0
autocmd FileType html,css,elm EmmetInstall

" Autoformat
noremap <F5> :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']

" neco-ghc
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_debug = 1

" save on ctrl+s
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" easier movements in splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vim-picker
nmap <unique> <leader>pe <Plug>PickerEdit
nmap <unique> <leader>ps <Plug>PickerSplit
nmap <unique> <leader>pv <Plug>PickerVsplit
nmap <unique> <leader>p] <Plug>PickerTag

" clang-format
let g:clang_format#code_style = 'llvm'
" let g:clang_format#auto_format = 1
" let g:clang_format#auto_formatexpr = 1
" let g:clang_format#auto_format_on_insert_leave = 1

" vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)<Paste>
