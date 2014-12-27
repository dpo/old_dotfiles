" Vim configuration file.

" Disable pesky "Press ENTER..." message.
:set cmdheight=1

" Load pathogen (automatically loads all packages in the bundle dir).
filetype off

" To disable a plugin, add its bundle name to the following list
let g:pathogen_disabled = []

" Gundo requires at least vim 7.3
if v:version < '703' || !has('python')
  call add(g:pathogen_disabled, 'gundo')
endif

"call pathogen#runtime_append_all_bundles()
execute pathogen#infect()
call pathogen#helptags()

" --------------------------------------------------------------
" Basic settings (some are overridden later based on file type).
" --------------------------------------------------------------

filetype on
filetype plugin on
filetype indent on   " Automatic indentation.
syntax on            " Enable syntax highlighting if terminal has colors.

let mapleader=","    " Change leader key to the comma.
set nocompatible     " Use Vim defaults instead of 100% vi compatibility.
set backspace=indent,eol,start  " More powerful backspacing.
"set bs=2            " Allow backspacing over everything in insert mode.
set nohlsearch       " Don't highlight the last used search pattern.
set nojoinspaces     " Don't insert 2 spaces after period when reflowing paragraphs.
set hidden           " Hide buffers instead of closing them.
set showcmd          " Show (partial) command in status line.
set showmatch        " Show matching brackets.

set title            " Set window title to vim document.

set ignorecase       " Do case insensitive matching.
set smartcase        " Ignore case if search pattern is all lowercase,
                     "    case-sensitive otherwise.
set incsearch        " Incremental search.

set autowrite        " Automatically save before commands like :next and :make
set backup           " Keep a backup file.
set viminfo='20,\"50 " Use a .viminfo file; don't store more than 50 lines.
set history=50       " Command history.
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.
set ff=unix          " Write using unix line endings.
set confirm          " Y-N-C prompt if closing with unsaved changes.

set autoindent       " Automatically indent lines.
set copyindent       " Copy the previous indentation on autoindenting.

set noerrorbells     " No audible bell.
set visualbell       " Flash screen.

set wildchar=<TAB>   " Character used for expansion = TAB.
set completeopt=menuone,longest,preview
set pumheight=8      " Keep small completion window.

set ruler            " Show cursor line and column in the status line.
set showmode         " Display mode INSERT/REPLACE/...
" set magic          " Changes special characters in search patterns (default).
set esckeys          " To use keypad keys and map missed escape sequences.

set expandtab        " Replace all tabs by spaces.
set textwidth=0      " Do not limit the number of columns in general.
set shiftwidth=2     " Number of spaces to auto indent.
set shiftround       " Use multiple of shiftwidth when indenting with '<' and '>'.
set tabstop=2        " Default width of a tab.
set scrolloff=3      " Keep 3 context lines above and below the cursor.
set mouse=a          " Enables scrolling with the mouse. Awesome!

set linebreak        " Don't wrap text in the middle of a word.
set number           " Show line numbers.


" Close preview window automatically when we move around.
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave  * if pumvisible() == 0|pclose|endif

" Set status line with fugitive info.
set statusline=%F%m%r%h%w%=%{fugitive#statusline()}\ (%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" ----------------------------------
" General vim settings and commands.
" ----------------------------------

" Put temporary files away.
set backupdir=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

" Scroll the viewport 3 lines at a time.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Map :W to :w.
command! W :w

" Automatically reload .vimrc on save
autocmd! bufwritepost .vimrc source %

" Shortcuts to quickly edit/reload .vimrc
map <silent> <leader>v :vs $MYVIMRC<CR><C-W>
map <silent> <leader>V :so $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Paragraph reflowing.
vmap Q gq
nmap Q gqap
nnoremap <leader>q gqip

" Use T (top) and B (bottom) to jump to top or bottom of frame.
nmap T H
nmap B L
" M jumps to the middle of the frame.

" Don't jump over wrapped long lines.
nnoremap <down> gj
nnoremap <up> gk

" Automatically change to the directory where the file being edited lives.
" It seems that set autochdir may break some plugins.
autocmd BufEnter * lcd %:p:h

" Highlight errors, todos and evil trailing whitespace.
hi Error term=reverse  ctermbg=Red    ctermfg=White guibg=Red  guifg=White
hi Todo  term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
highlight link ExtraWhitespace Error
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Color scheme.
:if $TERM == "xterm-256color"
    so ~/.vim.local/color256.vim   " If your terminal has 256 colors.
:else
    so ~/.vim.local/color16.vim    " If your terminal has  16 colors.
:endif

" Clear all trailing whitespace in one mean keystroke.
:nnoremap <silent> <F1> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Clear all trailing whitespace when saving.
"autocmd BufWritePre * :call <SID>StripWhite()
"fun! <SID>StripWhite()
"  %s/[ \t]\+$//ge
"  %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
"endfun

"function! StrRepeat(seq,times)
"  echomsg a:seq . " " . a:times
"  let str = ""
"  let i = 0
"
"  while i < a:times
"    let str = str . a:seq
"    let i = i + 1
"  endwhile
"
"  return str
"endfunction

" Various other syntax highlighting customizations.
let b:nroff_is_groff=1

" Paste mode.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set clipboard=unnamed

" Paste from clipboard.
map <leader>p "+gP

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pdf,.ps,.eps,.fdb_latexmk,.fls,.ind,.loe,.lof,.lot,.dpth,.md5,.auxlock,.tkzfct.gnuplot,.tkzfct.table

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Some emacs/pico like keybindings for insert mode
:imap <C-A> <ESC>0i
:imap <C-E> <ESC>$a
:imap <C-P> <ESC>ki
:imap <C-N> <ESC>ji
:imap <C-B> <ESC>la
:imap <C-F> <ESC>ha

" The MacBook Pro keyboard does not have Page-Up / Page-Down.
:map <ESC>[5~ <PageUp>
:map <ESC>[6~ <PageDown>

" This beauty remembers where you were the last time you edited the file,
" and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" TagList.
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" vimdiff options.
set diffopt+=iwhite  " Ignore blanks.

" Spell checking
"set spell
"set spell spelllang=en_us
"set spellfile=~/.vim/spellfile.add

" Command-T file search.
map <leader>T :CommandT<CR>
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']  " ESC to close search window.
endif

" -------------------------------------
" Specific settings based on file type.
" -------------------------------------

" LaTeX stuff.
let g:tex_flavor='latex'   " Restore filetype of empty tex file to 'latex'.
au FileType tex so ~/.vim.local/latex/latex.vim     " Load LaTeX prefs.

" RestructuredText stuff.
au FileType rst so ~/.vim.local/rst/rst.vim  " For easy compilation.
au FileType rst set syntax=rst               " For syntax highlighting.

" Markdown stuff.
au FileType md       so ~/.vim.local/markdown/markdown.vim  " For easy compilation.
au FileType mkd      so ~/.vim.local/markdown/markdown.vim  " For easy compilation.
au FileType mkdn     so ~/.vim.local/markdown/markdown.vim  " For easy compilation.
au FileType mdown    so ~/.vim.local/markdown/markdown.vim  " For easy compilation.
au FileType markdown so ~/.vim.local/markdown/markdown.vim  " For easy compilation.

" Fortran stuff.
au FileType fortran so ~/.vim.local/fortran/fortran.vim

au FileType osa set syn=applescript

" Don't expand tabs in Makefiles.
autocmd FileType make set noexpandtab

" Use appropriate hightlighting for certain file types.
au BufNewFile,BufRead *.pyf set filetype=fortran
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* set filetype=mail

autocmd BufRead,BufNewFile *.txt set tw=79
autocmd BufRead,BufNewFile *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://

" Special settings for Ruby files.
au FileType ruby so ~/.vim.local/ruby/ruby.vim

" Special settings for Python files.
"au FileType python so ~/.vim/python/python.vim
au FileType python so ~/.vim.local/python/python.vim
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" Cython syntax highlighting.
au FileType pyx so ~/.vim.local/syntax/cython.vim
au FileType pxd so ~/.vim.local/syntax/cython.vim
au FileType pyx set syntax=cython
au FileType pxd set syntax=cython

" Julia syntax highlighting.
au FileType julia so ~/.vim.local/julia/julia.vim

" Italics.
set t_ZH=[3m
set t_ZR=[23m

" Snippets.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
set runtimepath+=~/.vim.local
let g:UltiSnipsSnippetDirectories=["ultisnips"]

