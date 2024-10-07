return {
	{ -- file favorites manager
		"theprimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>hf", mark.add_file, { desc = "[h]arpoon [f]ile" })
			vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu, { desc = "[h]arpoon menu [t]oggle" })
			vim.keymap.set("n", "<leader>h1", function()
				ui.nav_file(1)
			end, { desc = "[h]arpoon file [1]" })
			vim.keymap.set("n", "<leader>h2", function()
				ui.nav_file(2)
			end, { desc = "[h]arpoon file [2]" })
			vim.keymap.set("n", "<leader>h3", function()
				ui.nav_file(3)
			end, { desc = "[h]arpoon file [3]" })
			vim.keymap.set("n", "<leader>h4", function()
				ui.nav_file(4)
			end, { desc = "[h]arpoon file [4]" })
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
