" FIXME: This is not cross platform. Think about moving to a variables.vim that is outside of VCS?
let path_reason_language_server = '/usr/bin/reason-language-server.exe'
let path_fzf = '/home/daniel/.fzf'

" Plugins
call plug#begin('~/.config/nvim/plug')

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mxw/vim-jsx'
Plug '/home/daniel/.fzf'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'tpope/vim-vinegar'

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
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" LanguageClient-neovim
"
" Assumes language servers have been installed:
" - https://github.com/jaredly/reason-language-server 
" - https://github.com/sourcegraph/javascript-typescript-langserver

set hidden                                           " required for operations modifying several buffers e.g. rename
let g:LanguageClient_diagnosticsList = 'Location'    " use location list for diagnostic information, don't clobber quickfix
let g:LanguageClient_serverCommands = {
  \ 'reason': [path_reason_language_server],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'typescript': ['javascript-typescript-stdio']
  \ }
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Colorscheme
syntax enable
set background=light
colorscheme solarized
