so ~/.vim.local/code.vim

compiler rst
set makeprg=rst2pdf\ %
let openpdfname = "!open -a Skim " . expand("%:t:r") . ".pdf"
map <F6> :silent execute openpdfname<CR>:redraw!<CR>
map <F5> :silent make!<CR>:redraw!<CR>

set textwidth=79

