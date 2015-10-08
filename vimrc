execute pathogen#infect()
syntax on
filetype plugin on
filetype plugin indent on

" rainbow parens
let g:rainbow_active = 1

set smarttab
set ruler
set autoindent
set smartindent
set expandtab
set guifont=Hack-Regular:h12
set number
set relativenumber
set textwidth=80
set tw=80
set wrap
set wrap linebreak nolist
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

" ctags optimization
set autochdir
set tags=tags

" fix curly braces
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>)]}

"paper color theme
set t_Co=256
set background=dark
colorscheme PaperColor

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_cpp_include_dirs = ['/Users/joseph/of_v0.9.0RC1_osx_release/libs/*', '/Users/joseph/of_v0.9.0RC1_osx_release/libs/openFrameworks/', '/Users/joseph/of_v0.9.0RC1_osx_release/libs/openFrameworks/utils/', '/Users/joseph/of_v0.9.0RC1_osx_release/libs/glew/include/GL/', '/Users/joseph/Code/Github/openFrameworks090/libs/tess2/include/', '/Users/joseph/of_v0.9.0RC1_osx_release/libs/glew/include/', '/Users/joseph/Code/Github/openFrameworks090/libs/openFrameworks/utils/', '/Users/joseph/of_v0.9.0RC1_osx_release/libs/boost/include/', '/Users/joseph/of_v0.9.0RC1_osx_release/libs/openFrameworks/types/']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 0
let g:syntastic_enable_balloons = 1

" Transparency
if has("gui_macvim")
    set transparency=10
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L
    set guioptions-=R
    set guioptions-=m
    set guioptions-=T
endif

 imap <D-Up>   <Plug>(macvim-transparency-inc)
 imap <D-Down> <Plug>(macvim-transparency-dec)
" imap <F10>    <Plug>(macvim-transparency-roll)
"
" xmap <D-Up>   <Plug>(macvim-transparency-inc)
" xmap <D-Down> <Plug>(macvim-transparency-dec)
" xmap <F10>    <Plug>(macvim-transparency-roll)"

" vim-autoformat
let g:formatdef_clangformat_objc = '"clang-format -style=file"'

" omnisharp stuff
let g:OmniSharp_host = "http://localhost:2000"
let g:OmniSharp_timeout = 1
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:OmniSharp_timeout = 1
set cmdheight=2
"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
"Don't ask to save when changing buffers (i.e. when jumping to a type
"definition)
"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow
let g:OmniSharp_selector_ui = 'unite'  " Use unite.vim

augroup omnisharp_commands
  autocmd!
  "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion
  "plugin)
      autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
    "Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
set hidden

" vim airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" omnisharp 


