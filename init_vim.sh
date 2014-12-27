#!/bin/sh

dotfiles=$PWD

# Install Vim-Pathogen.
[[ ! -d ~/.vim ]] && mkdir ~/.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim
ln -s ${dotfiles}/.vim/*.sh .
git init

# Link other vim-related dotfiles.
cd ~
ln -s ${dotfiles}/.vimrc .
ln -s ${dotfiles}/.vim.local .
ln -s ${dotfiles}/.vimpagerrc .

