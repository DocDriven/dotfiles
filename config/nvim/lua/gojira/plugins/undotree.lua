return {
	{ -- Undo history visualization
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "undotree", noremap = true, silent = true },
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
