so ~/.vim.local/code.vim
autocmd BufRead,BufNewFile *.f   let fortran_fixed_source=1
autocmd BufRead,BufNewFile *.for let fortran_fixed_source=1
autocmd BufRead,BufNewFile *.F   let fortran_fixed_source=1
autocmd BufRead,BufNewFile *.f90 let fortran_free_source=1
autocmd BufRead,BufNewFile *.f95 let fortran_free_source=1
autocmd BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1   " Indent do loops.

set textwidth=79
autocmd BufRead,BufNewFile *.f   set textwidth=72
autocmd BufRead,BufNewFile *.F   set textwidth=72

let fortran_more_precise=1      " Slow!

