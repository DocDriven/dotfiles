return {
	{ -- TUI file browser
		"francoiscabrol/ranger.vim",
		lazy = false,
		dependencies = {
			"rbgrouleff/bclose.vim",
		},
		init = function()
			vim.g.ranger_map_keys = 0
			vim.g.bclose_no_plugin_maps = true
		end,
		keys = {
			{ "<leader>r", "<cmd>Ranger<cr>", desc = "ranger", noremap = true, silent = true },
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
