" Plugins
call plug#begin('~/.config/nvim/plug')

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug '/usr/local/opt/fzf'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

" Misc. preferences
set number                      " enable line numbers
set splitright                  " horizontally split to the right
set splitbelow                  " vertically spit blow
set mouse=                      " disable mouse
set tabstop=2                   " existing tabs render as 2 space-width
set shiftwidth=2                " when indenting with '>', use 2-space width
set expandtab                   " insert spaces instead of tabs
set tags=.tags;/                " Traverse up file directory for ctags
set wildignore=*/node_modules/* 
nnoremap <C-J> <C-W><C-J>       " easier down split navigation
nnoremap <C-K> <C-W><C-K>       " easier up split navigation
nnoremap <C-L> <C-W><C-L>       " easier right split navigation
nnoremap <C-H> <C-W><C-H>       " easier left split navigation

" Prettier
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Colorscheme
syntax enable
set background=dark
colorscheme solarized

