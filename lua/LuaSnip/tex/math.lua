local ls = require('luasnip')
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep



return{
snip({trig='ff', dscr="Expands 'ff' into '\frac{}{}'"},
	{
		text('\\frac{'),
		insert(1),
		text('}{'),
		insert(2),
		text('}')
	}
)
}
