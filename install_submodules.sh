#!/bin/bash

# Make sure we're in the right directory.
cd ~/.vim

## Git.
### fugitive: interface git commands in Vim.
git submodule add https://github.com/tpope/vim-fugitive.git bundle/fugitive
### vim-git: syntax highlighting for git-related files.
git submodule add https://github.com/tpope/vim-git.git bundle/vim-git

## Multiple buffers.
### F3.
git submodule add https://github.com/vim-scripts/SelectBuf.git bundle/selectbuf

# LaTeX stuff.
git submodule add https://github.com/LaTeX-Box-Team/LaTeX-Box bundle/latex-box

## Text manipulation.
### UltiSnips: snippets a la TextMate.
### (bundle/ultisnips/ftdetect should be symlinked into ~/.vim/ftdetect)
### Snippet dirs are subdirs of runtimepath listed in g:UltiSnipsSnippetDirectories.
git submodule add https://github.com/SirVer/ultisnips.git bundle/UltiSnips
git submodule add https://github.com/honza/vim-snippets.git bundle/vim-snippets
### NerdCommenter: comment/uncomment lines.
git submodule add https://github.com/scrooloose/nerdcommenter bundle/nerdcommenter

## Advanced undo.
#git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo

## Python stuff.
### Python-mode: includes pylint, rope, pydoc, pyflakes, pep8, mccabe...
git submodule add https://github.com/klen/python-mode bundle/python-mode
### Pytest: interactively run unit tests. Requires "pip install pytest".
git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test

## Advanced search.
#git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
git submodule add https://github.com/wincent/Command-T.git bundle/command-t

## IDE stuff.
git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
git submodule add https://github.com/bling/vim-airline.git bundle/vim-airline

## Markdown.
git submodule add https://github.com/goldfeld/criticmarkup-vim.git bundle/criticmarkup-vim

## Full screen mode.
git submodule add https://github.com/mikewest/vimroom.git bundle/vimroom

## Pager.
### This is aliased as `less`.
git submodule add https://github.com/rkitover/vimpager bundle/vimpager

## Themes.
git submodule add https://github.com/nanotech/jellybeans.vim.git bundle/jellybeans

## Applescript.
git submodule add https://github.com/vim-scripts/applescript.vim bundle/applescript

## Julia-Vim.
git submodule add https://github.com/JuliaLang/julia-vim.git bundle/julia-vim

## Ruby.
### Enforce certain stylistic standards for Ruby code.
git submodule add https://github.com/ngmy/vim-rubocop.git bundle/vim-rubocop

## Debuggers.
# DBGPavim.
### VDebug
git submodule add https://github.com/joonty/vdebug.git bundle/vdebug
### VimDebug.
#git submodule add https://github.com/jaredly/vim-debug.git bundle/vim-debug

# Other.
## Genutils: required for selectbuf.
git submodule add https://github.com/vim-scripts/genutils.git bundle/genutils

git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update

# Make command-T.
cd ~/.vim/bundle/command-t
rake make
cd -
