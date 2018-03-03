" Set compatibility to Vim only.
set nocompatible
filetype off
syntax on
filetype plugin indent on
call pathogen#infect()

" Typo binds
command! W write
command! Q quit

" Turn on syntax highlighting.
syntax on
set t_Co=256
color wombat256mod

" Turn modelines off
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
"set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
"set softtabstop=2
set noshiftround
set expandtab

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%{StatuslineGit()}]\ [BUFFER=%n]\ %{strftime('%c')}

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

autocmd vimenter * NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Python settings
let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_lint_checkers = ['pylint']
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

" Rust YCM
let g:ycm_rust_src_oath = '~/.cargo/bin/rustc'

" Rust keybinds
:autocmd FileType rust nnoremap <Leader>r :!cargo run<CR>
:autocmd FileType rust nnoremap <Leader>c :!cargo check<CR>
:autocmd FileType rust nnoremap <Leader>b :!cargo build<CR>

" Rust auto build (WIP)
" :autocmd BufWritePost *.rs :silent !cargo build

" Change cursor shape on mode change
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

