" Notes
" ===
" - Used for both neovim and vim
"
" Resources
" ===
" - https://neovim.io/doc/user/nvim.html#nvim-from-vim

" Pathogen Vim Plugin Manager
execute pathogen#infect()

" True color support, only available on Vim 8.+
if exists("&termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors				
endif
" Solarized Color Scheme; use background 'dark' or 'light'
set background=dark
colorscheme solarized8

filetype plugin indent on
syntax on
set tabstop=4                   " show existing tab with 4 spaces width
set shiftwidth=4                " when indenting with '>', use 4 spaces width
set expandtab                   " On pressing tab, insert 4 spaces
set rnu                         " Relative number
set number                      " Line number for active line
set incsearch                   " Highlight while creating a search
set hlsearch                    " Highlight all matches when search
set backspace=2                 " allow backspace to delete most things in insert mode
