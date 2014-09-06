" Set Shell (as required for NeoBundle)
set shell=/bin/bash

" Turn return key into insert newline without going into insert mode.
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Type 'jk' or 'kj' quickly to exit insert mode.
imap jk <Esc>
imap kj <Esc>

" Fix an issue with 'vim-surround' plugin.
vmap s S

" The time until timing out for mapped key sequence like the one above.
set timeout timeoutlen=100 ttimeoutlen=50

" Tab/Indent
set autoindent
set shiftwidth=4
set tabstop=4

" Show number of current line.
set number

" Show line numbers relative to current line.
set relativenumber

" Searching / Moving
set ignorecase
set hlsearch " Highlight all the matches for the current search query.
set gdefault
set incsearch
set showmatch

" Always move up line visually.
nnoremap j gj
nnoremap k gk

" Show a horizontal line where the cursor is.
set cursorline

" Split lines (opposite of [J]oining lines).
nnoremap S i<cr><esc><right>

" Filetypes
filetype on
filetype plugin indent on

" Font
if has('gui_running')
    set guifont=SF\ Mono:h13
endif

" Show vertical column at line 128.
" set colorcolumn=128

" Disable MacVim's ugly scrollbars.
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Turn on syntax highlighting.
syntax on

" Advertise that our terminal supports 256 colors.
set t_Co=256

" Use a dark background.
set background=dark

" Use the WWDC 2016 colorscheme.
colorscheme wwdc16

" NeoBundle
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
end

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle.
NeoBundleFetch 'Shougo/neobundle.vim'

" List of plugins:
NeoBundle 'Keithbsmiley/swift.vim'	" Swift syntax highlighting support
NeoBundle 'dag/vim-fish'			" Fish config file support
NeoBundle 'ervandew/supertab'		" Tab completion
NeoBundle 'godlygeek/tabular'		" Alignment based on characters
NeoBundle 'junegunn/goyo.vim'		" Distraction-free writing
NeoBundle 'kien/ctrlp.vim'			" Fuzzy-file search	
NeoBundle 'myusuf3/numbers.vim'		" Manages line numbers (focus)
NeoBundle 'plasticboy/vim-markdown'	" Better Markdown support for Vim
NeoBundle 'rizzatti/dash.vim'		" Dash app support
NeoBundle 'rizzatti/funcoo.vim'		" Dependency for Dash ^
NeoBundle 'sjl/gundo.vim'			" Undo tree visualizer
NeoBundle 'tpope/vim-commentary'	" Better comment support
NeoBundle 'tpope/vim-fugitive'		" Git support
NeoBundle 'tpope/vim-repeat'		" Better repeating for Vim plugins
NeoBundle 'tpope/vim-sensible'		" Sensible defaults
NeoBundle 'tpope/vim-surround'		" Surrounding selection with characters
NeoBundle 'Townk/vim-autoclose'		" Autoclose [{(', etc.
NeoBundle 'groenewege/vim-less'		" LESS syntax highlighting, indenting and autocompletion
NeoBundle 'editorconfig/editorconfig-vim'	" Consistent coding styles
NeoBundle 'maksimr/vim-jsbeautify'	" Beautify JS files
NeoBundle 'bkad/CamelCaseMotion' 	" Move through CamelCaseWords with ease
NeoBundle 'vim-scripts/scratch.vim' " Ability to create a temporary scratch buffer
NeoBundle 'vim-scripts/Match-Bracket-for-Objective-C' " Automatically inserts matching starting bracket when ']' is pressed.
"NeoBundle 'guns/vim-clojure-static' " Clojure
"NeoBundle 'guns/ultisnips' " <c-j> and <c-k> move to the next/previous part of the function call
NeoBundle 'terhechte/syntastic'
NeoBundle 'toyamarinyon/vim-swift'  " Swift support
"let g:syntastic_enable_signs=1  " Show sidebar signs.
"let g:syntastic_objc_config_file = '.syntastic_complete'
"set statusline+=%#warningmsg#  " Add Error ruler.
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"nnoremap <silent> ` :Errors<CR>
"let g:syntastic_objc_checker = 'clang'

"NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'b4winckler/vim-objc'     " b4winckler's Objective-C config.
NeoBundle 'eraserhd/vim-ios'

call neobundle#end()

NeoBundleCheck

" Highlight .hbs files like html.
au BufRead,BufNewFile *.hbs set filetype=html

" Automatically beautify JS, HTML, and CSS code.
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Vim highlights curly braces in blocks as errors. To work around this:
let c_no_curly_error = 1

" "," is leader.
let mapleader = ","

" ,da for looking up searching the word under the cursor.
nmap <silent> <leader>da <Plug>DashSearch

" Automatically indent.
set autoindent

" Show the current mode.
set showmode

" Enter Normal Mode when MacVim loses focus.
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

" Enable wildcard matching for commands. Complete until the longest common string.
set wildmenu
set wildmode=list:longest

" Instead of beeping, use the visual bell.
set visualbell

" Don't keep a backup file or swap file.
set nobackup
set noswapfile

" Save all the time, automatically. It's 2014, computers should do this.
set autowriteall
au WinLeave,FocusLost,BufLeave,InsertLeave,CursorHold * :wa

" If a file has changed outside of vim, reload it (it seems MacVim may do this automatically, but terminal vim does not).
set autoread
