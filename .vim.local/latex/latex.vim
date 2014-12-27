so ~/.vim.local/code.vim

" Hit <F5> to compile LaTeX file and <F6> to fire up viewer.
"compiler tex
"set makeprg=latexmk\ -pdf\ -e\ '$latex=q/pdflatex\ %O\ -synctex=1\ -interaction=nonstopmode\ -shell-escape\ %S/'\ %
"let openpdfname = "!open -a skim " . expand("%:t:r") . ".pdf"
"let openpdfname = "!open -a TexShop.app " . expand("%:t:r") . ".pdf"
"let openpdfname = "!open -a preview " . expand("%:t:r") . ".pdf"
"map <F5> :silent make!<CR>:redraw!<CR>
"map <F6> :silent execute openpdfname<CR>:redraw!<CR>
"map <F7> :!latexmk -C<CR>

" LaTeX-Box settings.
let g:LatexBox_viewer = 'open -a Skim'
" let g:LatexBox_viewer = 'open -a TexShop'
" let g:LatexBox_viewer = 'open -a preview'
" let g:LatexBox_latexmk_options = '-pvc'
let g:LatexBox_latexmk_async = 1
let g:LatexBox_cite_pattern = '\c\\\a*cite\a*\*\?\_\s*{'
let g:LatexBox_ref_pattern = '\m\C\\v\?\(eq\|page\|auto\|[cC]\)\?ref\*\?\_\s*{'
let g:LatexBox_quickfix = 4
let g:LatexBox_autojump = 0
let g:LatexBox_plaintext_toc = 1
let g:LatexBox_show_warnings = 0  " warnings are not errors.
let g:LatexBox_ignore_warnings = ['Font']

imap <buffer> [[                \begin{
imap <buffer> ]]                <Plug>LatexCloseCurEnv
nmap <buffer> <F5>              <Plug>LatexChangeEnv
vmap <buffer> <F7>              <Plug>LatexWrapSelection
vmap <buffer> <S-F7>            <Plug>LatexEnvWrapSelection
imap <buffer> ((                \eqref{
map  <silent> <buffer> ¶ :call LatexBox_JumpToNextBraces(0)<CR>
map  <silent> <buffer> § :call LatexBox_JumpToNextBraces(1)<CR>
imap <silent> <buffer> ¶ <C-R>=LatexBox_JumpToNextBraces(0)<CR>
imap <silent> <buffer> § <C-R>=LatexBox_JumpToNextBraces(1)<CR>

" Grab a file in TeXLive with Command-T
map <Leader>tl :CommandT /usr/local/texlive/2014/texmf-dist/tex/latex<CR>

" Forward link with Skim.
" Remember that we require vim in server mode.
let texroot = fnamemodify(serverlist(), ":t:r")
map ,r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline <C-r>=line('.')<CR> <C-r>=texroot<CR>.pdf %<CR>:redraw!<CR>

set encoding=utf-8
set fileencoding=utf-8

set textwidth=79
set shiftwidth=2        " Smaller number for LaTeX files.
set tabstop=2           " Smaller number for LaTeX files.
set iskeyword+=:        " type \ref{fig: then <C-n> to cycle through.

:hi texBoldStyle       gui=bold        cterm=bold          term=bold
:hi texItalStyle       gui=italic      cterm=italic        term=italic
:hi texBoldItalStyle   gui=bold,italic cterm=bold,italic   term=bold,italic
:hi texItalBoldStyle   gui=bold,italic cterm=bold,italic   term=bold,italic

" Patterns for paragraph reflowing. Type gqlp in a paragraph to reflow.
" ... a bit buggy ...
map \gq ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\\|\\\[\\|\\\]\\|\\item\\|\\question\\|\\\(sub\)part\\|\\\(sub\)*section\\|\\noindent\\|%\)?1<CR>gq//-1<CR>
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\\|\\\[\\|\\\]\\|\\item\\|\\question\\|\\\(sub\)part\\|\\\(sub\)*section\\|\\noindent\\|%\)?1<CR>//-1<CR>.<CR>

nmap <leader>L gqlp
" gwlp restores cursor position but does not use fex/flp.
"nmap <leader>L gq}

" Jump to next/previous paragraph, subparagraph or subsubparagraph.
map <silent> >p :/\\\(sub\)\{,2}paragraph\*\=\s*{<CR> :noh<CR>
map <silent> <p :?\\\(sub\)\{,2}paragraph\*\=\s*{<CR> :noh<CR>

" Jump to next/previous paragraph (not subparagraph).
map <silent> >P :/\\paragraph\*\=\s*{<CR> :noh<CR>
map <silent> <P :?\\paragraph\*\=\s*{<CR> :noh<CR>

" Jump to next/previous section, subsection or subsubsection.
map <silent> >s :/\\\(sub\)\{,2}section\*\=\s*{<CR> :noh<CR>
map <silent> <s :?\\\(sub\)\{,2}section\*\=\s*{<CR> :noh<CR>

" Jump to next/previous section (not subsection).
map <silent> >S :/\\section\*\=\s*{<CR> :noh<CR>
map <silent> <S :?\\section\*\=\s*{<CR> :noh<CR>

" Jump to next/previous chapter.
map <silent> >C :/\\chapter\*\=\s*{<CR> :noh<CR>
map <silent> <C :?\\chapter\*\=\s*{<CR> :noh<CR>

" Jump to next/previous theorem.
map <silent> >t :/\\begin{theorem}<CR> :noh<CR>
map <silent> <t :?\\begin{theorem}<CR> :noh<CR>

" Jump to next/previous lemma.
map <silent> >l :/\\begin{lemma}<CR> :noh<CR>
map <silent> <l :?\\begin{lemma}<CR> :noh<CR>

" Jump to next/previous corollary.
map <silent> >c :/\\begin{corollary}<CR> :noh<CR>
map <silent> <c :?\\begin{corollary}<CR> :noh<CR>

" Define a command to TeX-ify column data in the text.
command! -range TeXtable :<line1>,<line2>s/\([ eE]\)\([+-]*[0-9][0-9.]*\)/\1\$\2\$/g | :<line1>,<line2>s/[ \t][ \t]*/ \& /g | :<line1>,<line2>s/$/ \\\\/
