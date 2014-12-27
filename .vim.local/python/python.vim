so ~/.vim.local/code.vim

" Use ipdb instead of pdb
"map <Leader>B Oimport ipdb; ipdb.set_trace()  # <-- BREAKPOINT<C-c>

" VDebug.
let g:vdebug_keymap['run']            = '<F5>'
let g:vdebug_keymap['run_to_cursor']  = '<Leader>h'  " here
let g:vdebug_keymap['step_over']      = '<Leader>n'  " next
let g:vdebug_keymap['step_into']      = '<Leader>s'  " step
let g:vdebug_keymap['step_out']       = '<Leader>o'  " out
let g:vdebug_keymap['close']          = '<Leader>x'
"let g:vdebug_keymap['detach']         = 'd'
let g:vdebug_keymap['set_breakpoint'] = '<Leader>B'
"let g:vdebug_keymap['get_context']    = 'x'
"let g:vdebug_keymap['eval_under_cursor'] = 'e'
"let g:vdebug_keymap['eval_visual']    = '<Leader>e'

"map <F4> :silent execute rdebug<CR>:redraw!<CR>  " :VdebugStart<CR>

function! Dbg(...)
  let rdebug = '!python -S /Users/dpo/local/komodo-python-dbgp/bin/pydbgp -d localhost:9000 % &'
  execute 'silent ' . rdebug
  python debugger.run()
endfunction
