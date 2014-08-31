set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif
  call vam#ActivateAddons([], {'auto_install' : 0})
endfun

call SetupVAM()
VAMActivate matchit.zip vim-addon-commenting
ActivateAddons vim-snippets snipmate

syntax on
set noeb vb t_vb=
colorscheme koehler 
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set relativenumber 
" set number 
set backspace=indent,eol,start
set mouse=a
set nowrap
set noswapfile
set wildmode=longest,full
set wildmenu
set laststatus=2
set ruler

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['darkgray',       'RoyalBlue3'],
    \ ['white',    'SeaGreen3'],
    \ ['black',    'DarkOrchid3'],
    \ ['gray',   'firebrick3'],
    \ ['brown',    'RoyalBlue3'],
    \ ['darkmagenta',     'SeaGreen3'],
    \ ['darkcyan', 'DarkOrchid3'],
    \ ['darkgreen',       'firebrick3'],
    \ ['darkblue',        'RoyalBlue3'],
    \ ['darkred',       'SeaGreen3'],
    \ ['yellow', 'DarkOrchid3'],
    \ ['magenta',    'firebrick3'],
    \ ['cyan',   'RoyalBlue3'],
    \ ['green',    'SeaGreen3'],
    \ ['blue',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:netrw_banner=0 
