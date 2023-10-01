return {
	{
		'kylechui/nvim-surround',
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup({})

		end
		
	},

	{
		'jiangmiao/auto-pairs',
	},

	{
		'alvan/vim-closetag'
	},

	{
		'tpope/vim-commentary'
	},
	{
		 "windwp/nvim-autopairs",
		event = 'InsertEnter',
		opts = {}
	}

}

