"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" File-top section
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" ALE and coc integration, needs to be before plugins
let g:ale_disable_lsp = 1

" Automatic VimPlug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/JamesLochhead/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Plugins
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

call plug#begin()
Plug 'JamesLochhead/ale'                                           " Async linting, code completion, etc
Plug 'JamesLochhead/vim-markdown'                                  " Vim markdown syntax highlighting
Plug 'JamesLochhead/tabular'                                       " Need for vim-markdown table formatting
Plug 'JamesLochhead/vim-terraform' 	 			   " Terraform integration
Plug 'JamesLochhead/vim-gitgutter'                                 " See changes that have been made to a file
Plug 'JamesLochhead/vim-commentary'                                " Shortcuts for commenting out code
Plug 'JamesLochhead/coc.nvim', {'branch': 'release'}               " Code completion
"Plug 'pearofducks/ansible-vim'                                    " Ansible syntax highlighting
Plug 'JamesLochhead/flattened'                                     " Current theme
Plug 'JamesLochhead/vim-indent-guides'                             " Indent guides for code blocks
Plug 'JamesLochhead/vim-better-whitespace' 			   " Show trailing whitespace in red
call plug#end()

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Plugin: hashivim/vim-terraform configuration
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" Run Terraform fmt on save
let g:terraform_fmt_on_save=0

" 2 space style indentation for TF files
let g:terraform_align=1

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Plugin: nathanaelkane/vim-indent-guides configuration
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#fdf6e3   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#f7f0dd ctermbg=4

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" General options
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set number relativenumber                      " Turn on line numbers
set mouse=a                                    " Turn on mouse mode
set nowrap                                     " No word wrapping
"set clipboard+=unnamedplus 		       " Always use the system clipboard
"set autoread                                  " Reload all changed files automatically
set colorcolumn=80,100                         " Column highlighting
"set textwidth=80                              " Set the width for auto wrapping
" Collapsed folds have no dots at the end:
set fillchars=fold:\ 

" Causing incorrect colours in Byobu:
set termguicolors                             " Enable True Color

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" File-type specific
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" Enable the filetype plugin for extra vim config files.
" Currently used for automatic Python docstring folding.
filetype plugin on

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

" foldmethod=syntax just for Python; necessary for docstring folding
autocmd FileType python setlocal foldenable foldmethod=syntax

" Set textwidth by file type
autocmd FileType markdown setlocal textwidth=80
autocmd FileType markdown setlocal spelllang=en_gb
autocmd FileType markdown setlocal conceallevel=2
autocmd FileType markdown setlocal colorcolumn=

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Plugin: ALE
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

let g:ale_python_pylint_executable = 'pylint-3'

" Turn on code completion; turn off if using another source
" 0 = off
let g:ale_completion_enabled = 0

" Override filetypes for specific paths so linters work
au BufRead,BufNewFile **.ansible.yaml set filetype=yaml.ansible
au BufRead,BufNewFile **.ansible.yml set filetype=yaml.ansible
au BufRead,BufNewFile **.cloudformation.yml set filetype=yaml.cloudformation
au BufRead,BufNewFile **.cloudformation.yaml set filetype=yaml.cloudformation

" Enabled fixers
let g:ale_fixers = {
\ 'yaml': ['prettier'],
\ 'javascript': ['prettier'],
\ 'json': ['prettier'],
\ 'sh': ['shfmt'],
\ 'python': ['black'],
\ 'terraform': ['terraform'],
\ 'html': ['prettier'],
\ 'css': ['prettier'],
\ 'go': ['gofmt'],
\}

let g:ale_sh_shfmt_options = '-i 0'

let g:ale_linters_ignore = {
\   'cloudformation': ['circleci', 'spectral', 'swaglint', 'yamllint'],
\}

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Shortcuts
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" Leader = ,
let mapleader = ","

" TableFormat using vim-markdown
noremap <Leader>t :TableFormat<cr>

" ALEFix
noremap <Leader>f :ALEFix<cr>

" Toggle spell check
noremap <Leader>s :set spell! spelllang=en_gb<cr>

" Toggle word wrapping
noremap <Leader>w :set wrap!<cr>

" Open init.vim in a new window
noremap <Leader>i :e ~/.config/nvim/init.vim<cr>

" windodiff this
noremap <Leader>d :windo diffthis<cr>

" windodiff this
noremap <Leader>e :diffoff<cr>

" Current column highlight
noremap <Leader>k :set cursorcolumn! cursorline!<cr>

" Check if a file has been modified
noremap <Leader>x :checktime

" Re-format visually highlighted blocks to textwidth
noremap <Leader>g gq

" Toggle indent guides
noremap <Leader>y :IndentGuidesToggle<cr>

" Activate init.vim changes
:noremap <Leader>u :source $MYVIMRC<cr>

" Edit the snippets for the current filetype
:noremap <Leader>q :CocCommand snippets.editSnippets<cr>

" Show buffers
nmap <Leader>b :buffers<cr>

" Next buffer
nmap <tab> :bn<cr>

" Previous buffer
nmap <S-tab> :bp<cr>

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Plugin: vim-markdown
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" Disable vim markdown code folding
let g:vim_markdown_folding_disabled = 1

" Disable code block concealment
let g:vim_markdown_conceal_code_blocks = 0

" Highlight Jekyll and Hugo front matter
let g:vim_markdown_frontmatter = 1

" Enable strikethrough
let g:vim_markdown_strikethrough = 1

" Number of spaces that are inserted when o is pressed in a list
let g:vim_markdown_new_list_item_indent = 0

" Disable automatic inseration of bullets
let g:vim_markdown_auto_insert_bullets = 0

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Plugin: vim-gitgutter
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" Make signs appear faster
set updatetime=100

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
" Plugin: coc
"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set signcolumn=yes

let g:coc_snippet_next = '<tab>'

let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-git', 'coc-cfn-lint', 'coc-pyright', 'coc-sh', 'coc-yaml', 'coc-swagger', 'coc-snippets']

colorscheme flattened_light
