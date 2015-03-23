set shell=/bin/bash

" Import bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

if filereadable(expand("~/.vimrc.tags"))
  source ~/.vimrc.tags
endif

set backspace=2   " Backspace deletes like most programs in insert mode
set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight matches
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set nowrap

" Auto run scripts
autocmd BufWrite * mark ' | silent! %s/\s\+$// | norm ''
autocmd BufWrite * let w:winview = winsaveview() | %s/\n\{3,}/\r\r\r/e | if exists('w:winview') | call winrestview(w:winview) | endif

" Save Binding
nmap <leader>s :w<CR>

" Quit Binding
nmap <leader>q :q<CR>

" Write-Quit Binding
nmap <leader>w :wq<CR>

" Ag Binding
nmap <leader>f :Ag!<space>

" Toggle nerdtree with F10
map <leader>d :NERDTreeToggle<CR>

" Close nertree after file is opened
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 45

" Force reload file
map <leader>e :e!<CR>

" Force redraw
map <leader>r :redraw!<CR>

" Toggle Buffer
map <leader>a :BufExplorer<CR>

" Toggle Paste Mode
nmap <leader>o :set paste!<CR>


" Snippets
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YCM
imap <c-k> <S-TAB>
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<c-j>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<c-k']
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" JSON Format
function! JsonExpand()
  :%!jq '.'
endfunction

function! JsonCompact()
  :%!jq -c '.'
endfunction

command JsonExpand call JsonExpand()
command JsonCompact call JsonCompact()

map <leader>j :JsonExpand<cr>

" Toggle tagbar
map <leader>t :TagbarToggle<CR>

" Settings for tagbar
let g:tagbar_autofocus = 1

" Vim Go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

" Vim Json
let g:vim_json_syntax_conceal = 0

" Allow modification in nerdtree
set modifiable

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Syntastic settings
let g:syntastic_enable_highlighting=1
let g:syntastic_auto_jump=0
let g:syntastic_check_on_open=0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_mode_map = { "mode": "active",
  \ "active_filetypes": [],
  \ "passive_filetypes": ["html"] }

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_open_new_file = 'h'

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='tomorrow'
set t_Co=256

:set smartcase
:set ignorecase
:set noantialias

" Color scheme
colorscheme Tomorrow-Night
set background=dark
set encoding=utf-8

" Numbers
set number
set numberwidth=5

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

if bufwinnr(1)
  map + <C-W>+
  map _ <C-W>-
endif

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" cmd n, cmd p for fwd/backward in search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

nnoremap <esc> :noh<return><esc>

" Disable Markdown Folding
let g:vim_markdown_folding_disabled=1

" TMux Navigator
" Don't allow any default key-mappings.
" let g:tmux_navigator_no_mappings = 1

" Re-enable tmux_navigator.vim default bindings, minus <c-\>.
" <c-\> conflicts with NERDTree "current file".


nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
