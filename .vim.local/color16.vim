" We have a color terminal
set t_Co=16
set t_Sf=^[[3%dm
set t_Sb=^[[4%dm

" Some highlighting definitions
" set background=dark
:colorscheme jellybeans

":colorscheme ir_black
":hi Visual cterm=bold ctermbg=black

":colorscheme solarized
"let g:solarized_termcolors=16
"let g:solarized_termtrans=0 " 1
"let g:solarized_degrade=0 " 1
"let g:solarized_bold=1 " 0
"let g:solarized_underline=1 " 0
"let g:solarized_italic=1 " 0
"let g:solarized_contrast='normal' " 'high' or 'low'
"let g:solarized_visibility='normal' " 'high' or 'low'

"" Highlight current line.
"" Thanks to SIMBL, a bold black background is a shade of gray...
"" See OSX Terminal preferences.
:set cursorline
"":hi CursorLine ctermbg=236    " Use if terminal has 256 colors.
":hi CursorLine cterm=bold ctermbg=black

