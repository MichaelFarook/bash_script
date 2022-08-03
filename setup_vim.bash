#!/usr/bin/env bash
#
# Setup line number in vim.

echo "
   set number
   autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0
   set relativenumber
   set shiftwidth=4
   set autoindent
   colorscheme peachpuff
   " >> ~/.vimrc 

echo ".vimrc updated"    
