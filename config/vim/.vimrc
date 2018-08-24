set nocompatible
set hidden
set t_Co=256

filetype on
filetype plugin on
syntax enable

set hlsearch
set nu
set showcmd



" Who doesn't like autoindent?
set autoindent
" 8 is default character tab
set shiftwidth=3
set softtabstop=3
set tabstop=3
" Spaces are better than a tab character
set expandtab
set smarttab

set wildmenu
set wildmode=list:longest,full

" sudo save
cmap w!! %!sudo tee > /dev/null %
" jj is escape
inoremap jj <ESC>
" set leader
let mapleader=","

" use Plug (instead of built in pathogen-alike manager)
" get:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin()
Plug 'SirVer/UltiSnips'
Plug 'honza/vim-snippets'
Plug 'kien/rainbow_parentheses.vim'

Plug 'tpope/vim-surround'
" ds<">    - delete <">
" cs<"><'> - change " to '
" ys<o><"> - wrap " around object e.g aw 

Plug 'tpope/vim-repeat'
Plug 'vim-scripts/EasyMotion'
" <leader><leader><motion>

Plug 'tpope/vim-commentary'
" \\<motion> comment/uncomment

Plug 'benmills/vimux'
" send selction
vmap <leader>s "vy :call VimuxRunCommand(@v . "\n", 0)<CR>
" send selction
nmap <leader>s V<leader>s<CR>
Plug 'vim-scripts/Screen-vim---gnu-screentmux'
" tmux with vim-screen
let g:ScreenImpl = 'Tmux'
Plug 'vim-scripts/Vim-R-plugin'
" \rf - start; \rq - quit
" \bd - send block, go down
" \sd - send selection


" matlab lint, for .m files
Plug 'vim-scripts/matlab.vim'
Plug 'vim-scripts/mlint.vim'

" colorschemes
Plug 'vim-scripts/xoria256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
autocmd BufEnter *.m    compiler mlint
" <leader>l
call plug#end()
"colorscheme xoria256
colorscheme molokai
