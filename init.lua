
--require('user.my_plugins')
--require('user.plugins_config')
--require('user.options')
--require('user.keymappings')
--require('user.cmp_config')
--require('user.latex')

require('config.options')
require('config.keymappings')
require('config.lazy')

-- vim.cmd([[colorscheme nightfox]])
-- vim.cmd([[colorscheme 256_noir]])
vim.cmd([[colorscheme nightfox]])

require('luasnip.loaders.from_vscode').lazy_load()
require('luasnip').add_snippets('tex', require('LuaSnip/tex/math'))
