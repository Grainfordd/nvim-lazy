local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- Auto-comando que reinicia neovim cuando se guarda la carpeta de plugins
vim.cmd[[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost my_plugins.lua source <afile> | PackerSync
	augroup end
]]



-- require('lazy').setup({
-- 	'nvim-lua/popup.nvim',
-- 	'nvim-lua/plenary.nvim',

-- 	-- Themes
-- 	'EdenEast/nightfox.nvim',
-- 	'sainnhe/everforest',
-- 	'sainnhe/gruvbox-material',

-- 	-- Syntax
-- 	-- {
-- 	-- 	'nvim-treesitter/nvim-treesitter',
-- 	-- 	run = function()
-- 	-- 		local ts_update = require('nvim-treesitter.install').update({with_sync = true})
-- 	-- 		ts_update()
-- 	-- 	end,
-- 	-- }

-- 	'p00f/nvim-ts-rainbow',
-- 	'nvim-treesitter/nvim-treesitter-refactor',

-- 	-- Highlight same words
-- 	'RRethy/vim-illuminate',

-- 	-- Notificaciones
-- 	'rcarriga/nvim-notify',

-- 	'akinsho/toggleterm.nvim',
-- 	'folke/which-key.nvim',

-- 	-- Status line
-- 	'ojroques/nvim-hardline',
-- 	'nvim-lualine/lualine.nvim',
-- 	'akinsho/bufferline.nvim',

-- 	'kylechui/nvim-surround',
-- 	'jiangmiao/auto-pairs',
-- 	'alvan/vim-closetag',

-- 	'nvim-tree/nvim-tree.lua',
-- 	'nvim-tree/nvim-web-devicons',

-- 	'christoomey/vim-tmux-navigator',
-- 	'easymotion/vim-easymotion',

-- 	-- Tabs
-- 	-- use 'ap/vim-buftabline'

-- 	-- Comentarios
-- 	'tpope/vim-commentary',

-- 	-- Html
-- 	'mattn/emmet-vim',

-- 	-- Mostrar lineas en la identacion
-- 	'yggdroot/indentline',

-- 	-- use {'neoclide/coc.nvim', branch = 'release'}

-- 	-- jueguitos
-- 	'ThePrimeagen/vim-be-good',

-- 	-- Terminal
-- 	'voldikss/vim-floaterm',


-- 	-- Scrollbar
-- 	'petertriho/nvim-scrollbar',
-- 	'karb94/neoscroll.nvim',
-- 	'folke/tokyonight.nvim',

-- 	-- color
-- 	'NvChad/nvim-colorizer.lua',
-- 	'ap/vim-css-color',

-- 	-- Fuzzy finder
-- 	'nvim-telescope/telescope.nvim',


-- 	-- LaTeX
-- 	'lervag/vimtex',
-- 	'frabjous/knap',


-- 	-- Autocompletion
-- 	'hrsh7th/nvim-cmp',
-- 	'hrsh7th/cmp-buffer',
-- 	'hrsh7th/cmp-path',
-- 	'hrsh7th/cmp-cmdline',
-- 	'hrsh7th/cmp-nvim-lsp',

-- 	'neovim/nvim-lspconfig',
-- 	'L3MON4D3/LuaSnip',
-- 	'saadparwaiz1/cmp_luasnip',
-- 	'rafamadriz/friendly-snippets'. -- Muchos snippets para usar

-- 	'williamboman/mason.nvim',
-- 	'williamboman/mason-lspconfig.nvim',
-- })

require('lazy').setup({
	'folke/which-key.nvim',
	{'folke/neoconf.nvim', cmd='Neoconf'},
	'folke/neodev.nvim',

	'nvim-tree/nvim-tree.lua',
 	'EdenEast/nightfox.nvim',
 	'nvim-lualine/lualine.nvim',

})
