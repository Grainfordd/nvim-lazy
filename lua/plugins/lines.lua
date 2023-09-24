return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {'nvim-tree/nvim-web-devicons'},
		opts  = {
			options = {
				theme = 'nightfox',
				globalstatus = true,
			}
		},
	},

	{
		'akinsho/bufferline.nvim',

		config = function()

			require('bufferline').setup{
				options = {
					hover = {
						enabled = true,
						delay = 200,
						reveal = {'close'},
					},
					separator = 'slope',
				}
			}
		end
	},
}
