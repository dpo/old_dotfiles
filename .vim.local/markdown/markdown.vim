so ~/.vim.local/code.vim

"compiler md
"set makeprg=md2pdf\ %\ -o\ %<.pdf
set makeprg=mmd2pdf\ %\ -o\ %<.pdf
" Skim doesn't seem to be watching the PDF file for changes... Why???
let openpdfname = "!open " . expand("%:t:r") . ".pdf"
map <F6> :silent execute openpdfname<CR>:redraw!<CR>
map <F5> :silent make!<CR>:redraw!<CR>

" Preview Markdown in Marked.
:nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<CR>:redraw!<CR>

" Preview Markdown in browser.
:nnoremap <leader>M :%w !pbcopy<CR><CR>:silent !/Users/dpo/bin/md-preview-browser.sh<CR>:redraw!<CR>
:nnoremap <leader>C :%w !pbcopy<CR><CR>:silent !/Users/dpo/bin/critic-preview-browser.sh<CR>:redraw!<CR>

set textwidth=79
