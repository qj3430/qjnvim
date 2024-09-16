return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		local f = ls.function_node
		local fmt = require("luasnip.extras.fmt").fmt

		vim.keymap.set({ "i", "s" }, "<C-K>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-L>", function()
			if ls.jumpable(1) then
				ls.jump(1)
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<C-J>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		ls.setup({
			link_children = true, -- Enable linking child snippets
			link_roots = true, -- Disable linking root snippets by default
			keep_roots = true, -- Remember multiple root snippets
		})

		ls.add_snippets("javascriptreact", {
			-- rafce: React Arrow Function Component Export
			s(
				"rafce",
				fmt(
					[[
            import React from 'react'

            const {} = ({}) => {{
              return (
                <div>
                  {}
                </div>
              )
            }}

            export default {}
          ]],
					{
						f(function(_, snip)
							return snip.env.TM_FILENAME_BASE or "ComponentName"
						end),
						i(1, "props"),
						i(2, "// Component content"),
						f(function(_, snip)
							return snip.env.TM_FILENAME_BASE or "ComponentName"
						end),
					}
				)
			),

			-- useState
			s(
				"sta",
				fmt(
					[[
            const [{}, set{}] = useState({})
          ]],
					{
						i(1, "state"),
						f(function(args)
							return (args[1][1]:gsub("^%l", string.upper))
						end, { 1 }),
						i(2, "initialState"),
					}
				)
			),

			-- useEffect
			s(
				"eff",
				fmt(
					[[
            useEffect(() => {{
              {}

              {}
            }}, [{}])
          ]],
					{
						i(1, "// Effect content"),
						i(2, "// Optional cleanup"),
						i(3),
					}
				)
			),
		})
	end,
}
