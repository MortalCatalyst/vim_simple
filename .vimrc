:set background&
"BEGIN_DEVASSISTANT_1
"Setting value devassistant to 0 will use your existing .vimrc file
"Setting value devassistant to 1 will use the vimrc defined by the devassistant feature

let devassistant=0
if devassistant==1
 :source /usr/share/devassistant/files/snippets/vim/vimrc
endif
"END_DEVASSISTANT_1
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'klen/python-mode'
" Plugin 'justinmk/vim-sneak'
Plugin 'easymotion/vim-easymotion' 
Plugin 'jiangmiao/auto-pairs'
Plugin 'flazz/vim-colorschemes'
Plugin 'JulesWang/css.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
" Plugin 'lukerandall/haskellmode-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'airblade/vim-rooter'
Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-repeat'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-unimpaired'
Plugin 'mattn/emmet-vim'
Plugin 'noah/vim256-color'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Glench/Vim-Jinja2-Syntax'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

" Plugin 'mustache/vim-mustache-handlebars'
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" ugin 'git://git.wincent.com/command-t.git'
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
syntax on
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab
set showcmd
set incsearch
set mouse=a
set completeopt=menu,menuone,longest
set pumheight=15
set wildmenu
set backspace=indent,eol,start
set guioptions-=T 
set guifont=Monospace\ 10.5

colorscheme cobalt 

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=56 columns=120
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
  if &diff
  " double the width up to a reasonable maximum
  let &columns = ((&columns*2 > 240)? 240: &columns*2)
    endif 
endif
" autocmd VimEnter * NERDTree
"replace with :Explore
let mapleader = ","
"map <leader>k :Explore<cr>
map <leader>m :NERDTreeToggle<CR>
" mapping for better emmet completion
imap <expr> <C-Z> emmet#expandAbbrIntelligent("\<C-Z>")
" set cut and paste
"
" copy and paste
set clipboard+=unnamedplus  " use the clipboards of vim and win
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" easymotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
map / <Plug>(easymotion-tn)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

let g:syntastic_javascript_checkers = ['jscs']

autocmd VimEnter * wincmd p

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nnoremap <leader>t :ConqueTermSplit bash<CR>
nnoremap <leader>r :ConqueTermSplit 

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

noremap <F3> :Autoformat<CR>

nmap <F8> :TagbarToggle<CR>
let g:ConqueTerm_CloseOnEnd = 1
let g:sneak#streak = 1
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,backbone,jquery,handlebars'
" klen python-mode
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
"
" " Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
"
" " Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"
" set omnifunc=syntaxcomplete#Complete

"vim-rooter
" currently set to git only
" https://github.com/airblade/vim-rooter
let g:rooter_autocmd_patterns = '*.git,*.js'

" easyclip
imap <c-v> <plug>EasyClipInsertModePaste
cmap <c-v> <plug>EasyClipCommandModePaste
nmap <leader>cf <plug>EasyClipToggleFormattedPaste

" more natural splits
set splitbelow
set splitright

" Setup some default ignores
 let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
     \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
     \}
"
"     " Use the nearest .git directory as the cwd
"     " This makes a lot of sense if you are working on a project that is in
"     version
"     " control. It also supports works with .svn, .hg, .bzr.
     let g:ctrlp_working_path_mode = 'r'
"
"" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>
"     "
" }
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
"
" " I want my own keymappings...
let g:buffergator_suppress_keymaps = 1
"
"" Looper buffers
let g:buffergator_mru_cycle_loop = 1
"
"" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>
"
" " View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>
"
"" Shared bindings from Solution #1 from earlier
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>"
" "
" indent to next line with spaces
 " imap <C-c> <CR><Esc>O
