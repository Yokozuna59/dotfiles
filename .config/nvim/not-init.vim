set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set incsearch               " incremental search
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin('~/.config/nvim/plugged')
Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Mofiqul/vscode.nvim'
Plug 'mhinz/vim-signify'
Plug 'someone-stole-my-name/yaml-companion.nvim'
Plug 'dense-analysis/ale'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" A fuzzy file finder
Plug 'kien/ctrlp.vim'
" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'
" Switch to the begining and the end of a block by pressing %
Plug 'tmhedberg/matchit'
" Nord
Plug 'arcticicestudio/nord-vim'
" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'
" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
call plug#end()

nnoremap <C-p> :Files<CR>
nnoremap <F4> :NERDTreeToggle<CR>
map <C-_> gcc k<CR>
vmap <C-_> gc<CR>
colorscheme vscode

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <c-space> coc#refresh()
