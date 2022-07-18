set scrolloff=8
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
set cursorline
" Better display for messages
set cmdheight=2
set number
set rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set lazyredraw
set termguicolors
" editor settings
set autoindent
set signcolumn=yes
"required for toggleterm at least
" https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden
" wildmenu offers cmd completion on the bottom but requires more
" mentaloverhead than i like atm
set wildmode=longest,list,full
"set wildmenu
syntax enable
syntax on


" Plugin Handler
call plug#begin('~/.vim/plugged')
" =========================================================
" absolutely essential stuff to the experience
" =========================================================
" Finding files, directories and others telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdcommenter'

" N Mode enhancements
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Treesitter support 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Semantic language support
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'ray-x/lsp_signature.nvim'

" Lint
Plug 'tamago324/nlsp-settings.nvim' " language server settings defined in json for
Plug 'jose-elias-alvarez/null-ls.nvim' "for formatters and linters
Plug 'simrat39/symbols-outline.nvim'

" the hrsh7th !!
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}

" Code UI optimisations
Plug 'j-hui/fidget.nvim'
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Movement enhancements
Plug 'phaazon/hop.nvim'

" Line 
Plug 'nvim-lualine/lualine.nvim'

" Terminal 
Plug 'akinsho/toggleterm.nvim', {'tag':  'v1.*'}

" go
Plug 'fatih/vim-go'

" rust
Plug 'simrat39/rust-tools.nvim'
"Plug 'rust-lang/rust.vim'
Plug 'Saecki/crates.nvim'

" editor enhancements surround setup for closing [{("' and more: https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

" Git Handler
"Plug 'tpope/vim-fugitive'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'rebelot/kanagawa.nvim'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Unsure 
" vim-caser grants bindings that allow changing the casing of words. May be
" useful for structs but is such a small thing that i dont know. Some of it
" can be done with a macro.
" Plug 'arthurxavierx/vim-caser'
" tabularize: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
"Plug 'godlygeek/tabular'

" If you want to display icons
 Plug 'kyazdani42/nvim-web-devicons' 

" Set root of folder when opening new file 
Plug 'airblade/vim-rooter'

" autoclose brackets and such:
Plug 'Raimondi/delimitMate'

" add toggle for transparent: only relevant for iterm, warp doesn't support
" transparancy yet
" Plug 'xiyaowong/nvim-transparent'
call plug#end()

autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false})
lua require('cfgx.hop')
lua require('cfgx.treesitter')
lua require('cfgx.cmp')
lua require('cfgx.colorscheme')
lua require('cfgx.lsp')
lua require("cfgx.keymappings")
lua require("cfgx.dab")
lua require('cfgx.telescope')
lua require('cfgx.toggleterm')
lua require('cfgx.lualine')
lua require('cfgx.lspsaga')
lua require('cfgx.trouble')
lua require('cfgx.fidget')
