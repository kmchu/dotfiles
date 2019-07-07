" Notes
" ===
" - Used for both neovim and vim
"
" Resources
" ===
" - https://neovim.io/doc/user/nvim.html#nvim-from-vim

" Pathogen Vim Plugin Manager
execute pathogen#infect()

" True color support
set termguicolors				
" Solarized Color Scheme; use background 'dark' or 'light'
set background=dark
colorscheme solarized8

filetype plugin indent on
syntax on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Relative number
set rnu
" Line number for active line
set number
" Highlight while creating a search
set incsearch
" Highlight all matches when search
set hlsearch
