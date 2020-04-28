" Notes
" ===
" - Used for both neovim, and tmux
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
set showcmd                     " see leader command time outs
set wildmenu
set wildmode=list:full
set hidden                      " allow switch between buffers without saving
" Android dev specific ignores
set wildignore+=*/build/generated/*,*/build/intermediates/*,*/build/kotlin/*,*/build/tmp/*

" Change cursor style based on mode
" https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Hotkeys
" ===
nnoremap <Space> <Nop>
vnoremap <Space> <Nop>
map <Space> <Leader>

" vim-clap
nnoremap <silent> <Leader>cf :Clap files<CR>
nnoremap <silent> <Leader>cg :Clap grep<CR>

" LSP
" ===
lua << EOF

local nvim_lsp = require'nvim_lsp'
nvim_lsp.kotlinls.setup{}
nvim_lsp.bashls.setup{}

EOF

autocmd Filetype kotlin,sh setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
