return {
	{ -- git wrapper
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>G", vim.cmd.Git, desc = "[G]it fugitive", noremap = true },
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
