return {
	{ -- dim inactive windows
		"sunjon/shade.nvim",
		config = function()
			require("shade").setup({
				overlay_opacity = 50,
				opacity_step = 1,
				keys = {
					brightness_up = "<C-Up>",
					brightness_down = "<C-Down>",
					toggle = "<C-s>",
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
