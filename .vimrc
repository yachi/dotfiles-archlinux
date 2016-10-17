if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set t_8b="\e[38;2;%lu;%lu;%lum]"
  set t_8f="\e[48;2;%lu;%lu;%lum]"
  set guicolors
endif

let g:dotvim_settings = {}
let g:dotvim_settings.version = 2
let g:dotvim_settings.plugin_groups_exclude = []

let g:airline_powerline_fonts = 1

let base16colorspace=256

source ~/.vim/vimrc

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep= "\ue0b0"
let g:ctrlp_user_command = 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
let g:ctrlp_use_caching = 0

set relativenumber
set number

set background=dark
colorscheme base16-paraiso

" fix file reload
autocmd BufEnter,FocusGained * checktime
