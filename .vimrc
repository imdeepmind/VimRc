" Installing the plugins

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
call plug#end()

" Configurations for the editor
set number
set laststatus=2
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=89
set textwidth=89
set foldmethod=indent
set foldlevel=99
set autoindent
set expandtab

" Syntax highlighting
let python_highlight_all=1
syntax on


" NERDTree configurations
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
    let g:nerdtree_open = 1
    wincmd p
endif
endfunction


" Starting NERDTree automatically
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Airline Conf
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

# Autocomplete YCM conf
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CTRLP conf
let g:ctrlp_map = '<c-p>'

" Tagbar conf
nmap <F8> :TagbarToggle<CR>

" Automatically opening Tagbar
" Starting NERDTree automatically
function! StartUpTagbar()
    if 0 == argc()
        TagbarToggle
    end
endfunction

autocmd VimEnter * call StartUpTagbar()
