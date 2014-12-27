#!/bin/sh

# Install Vim-Pathogen.
[[ ! -d ~/.vim ]] && mkdir ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
