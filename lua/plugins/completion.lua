return {
	{
		'rcarriga/nvim-notify',
		config = function()
			require('notify').setup{
			stages = 'fade_in_slide_out',
			}
		end
	},



   {
      "hrsh7th/nvim-cmp",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-nvim-lua",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-cmdline",
         "hrsh7th/cmp-buffer",
		 "hrsh7th/cmp-nvim-lsp-signature-help",
         "L3MON4D3/LuaSnip",
         "saadparwaiz1/cmp_luasnip",
         "onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
      },
      config = function()
         local lspkind = require("lspkind")
         local cmp = require("cmp")
		 local luasnip = require('luasnip')
		 local cmp_autopairs = require('nvim-autopairs.completion.cmp')

			luasnip.setup({
				region_check_events = 'CursorHold,InsertLeave',
				delete_check_events = 'TextChanged,InsertLeave'
			})
	
         cmp.setup({
            snippet = {
               expand = function(args)
                  require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
               end,
            },
            window = {
               completion = cmp.config.window.bordered(),
               documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
               ["<C-b>"] = cmp.mapping.scroll_docs(-4),
               -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
               ["<C-f>"] = cmp.mapping.abort(),
               ["<CR>"] = cmp.mapping.confirm({ select = false }),
				['<C-e>'] = cmp.mapping.abort(),
               -- ["<Tab>"] = cmp.mapping.select_next_item(),
               -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
			   ['<Tab>'] = cmp.mapping(function (fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable then
							luasnip.expand_or_jump()

						-- elseif has_words_before() then
						-- 	cmp.complete()
						else
							fallback()
						end
			   end, {'i', 's'}),

				['<S-Tab>'] = cmp.mapping(function (fallback)
						if cmp.visible() then
							cmp.select_prev_item()

						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
				end, {'i', 's'})
            }),
            sources = cmp.config.sources({
               { name = 'luasnip' },
               { name = 'nvim_lsp' },
               { name = 'nvim_lua' },
               { name = 'buffer' },
			   { name = 'path' },
			   { name = 'nvim_lsp_signature_help' },
            }),
            enabled = function()
               -- disable completion in comments
               local context = require 'cmp.config.context'

               -- keep command mode completion enabled
               if vim.api.nvim_get_mode().mode == 'c' then
                  return true
               else
                  return not context.in_treesitter_capture("comment")
                  and not context.in_syntax_group("Comment")
               end
            end,
            formatting = {
               format = lspkind.cmp_format({
                  mode = "symbol_text",
                  maxwidth = 50,
                  ellipsis_char = '...',
                  menu = ({
                     buffer = "[Buffer]",
                     nvim_lsp = "[LSP]",
                     nvim_lua = "[Lua]",
                     luasnip = "[LuaSnip]",
                     latex_symbols = "[Latex]",
                  })
               }),
            }
         })

         cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
               { name = "buffer" }
            }
         })

         cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "path" } },
            { { name = "cmdline" } })
         })
		
		cmp.event:on(
			'confirm_done',
			cmp_autopairs.on_confirm_done()
		)
      end
   },
}
