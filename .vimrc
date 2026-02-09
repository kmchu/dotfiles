" Notes
" ===
" - Used for both neovim, and tmux
"
" Resources
" ===
" - https://neovim.io/doc/user/nvim.html#nvim-from-vim

" Auto-handle autoload/plug.vim is empty, then download plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

" File support
Plug 'ekalinin/Dockerfile.vim'
Plug 'udalov/kotlin-vim'
Plug 'andreshazard/vim-freemarker'

" Integrations
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Enhancements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Theme
Plug 'lifepillar/vim-solarized8'

Plug 'neovim/nvim-lspconfig' " Configuration for Nvim LSP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'jc-doyle/cmp-pandoc-references'

call plug#end()

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
filetype plugin on
set omnifunc=syntaxcomplete#Complete
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

tnoremap <Esc> <C-\><C-n>

" telescope.nvim
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" vim-clap
" nnoremap <silent> <Leader>cf :Clap files<CR>
" nnoremap <silent> <Leader>cg :Clap grep<CR>

" Templates
" ===
:autocmd BufNewFile *.md	0r ~/.vim/templates/skeleton.md

:autocmd BufNewFile *.md  ks|call MdFmDate()|'s
:fun MdFmDate()
:  if line("$") > 20
:    let l = 20
:  else
:    let l = line("$")
:  endif
:  exe "1," . l . "g/date: /s/date: .*/date: " . strftime("%Y-%m-%d %X")
:endfun

:autocmd BufNewFile *.md  ks|call MdFmTitle()|'s
:fun MdFmTitle()
:  if line("$") > 20
:    let l = 20
:  else
:    let l = line("$")
:  endif
:  exe "1," . l . "g/title: /s/title: .*/title: " . expand('%:t:r')
:  exe "1," . l . "g/title: /s/_/\./"
:  exe "1," . l . "g/title: /s/-/ /g"
:  exe "1," . l . "g/title: /s/\\<./\\u&/g"
:  exe "1," . l . "g/Title: /s/Title:/title:/"
:endfun

:autocmd BufNewFile *.md  ks|call MdTitle()|'s
:fun MdTitle()
:  if line("$") > 20
:    let l = 20
:  else
:    let l = line("$")
:  endif
:  exe "1," . l . "g/^# /s/# .*/# " . expand('%:t:r')
:  exe "1," . l . "g/^# /s/_/\."
:  exe "1," . l . "g/^# /s/-/ /g"
:  exe "1," . l . "g/^# /s/\\<./\\u&/g"
:endfun
