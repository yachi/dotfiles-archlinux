set t_8b="\e[38;2;%lu;%lu;%lum]"
set t_8f="\e[48;2;%lu;%lu;%lum]"
set guicolors

let g:dotvim_settings = {}
let g:dotvim_settings.version = 1
let g:dotvim_settings.plugin_groups_exclude = []

let g:airline_powerline_fonts = 1

let base16colorspace=256

source ~/.vim/vimrc

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep= "\ue0b0"

set relativenumber
set number
