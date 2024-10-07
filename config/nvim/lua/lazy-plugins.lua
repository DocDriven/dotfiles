-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--

	-- modular approach: using `require 'path/name'` will
	-- include a plugin definition from file lua/path/name.lua

	require("gojira/plugins/gitsigns"),

	require("gojira/plugins/which-key"),

	require("gojira/plugins/telescope"),

	require("gojira/plugins/lspconfig"),

	require("gojira/plugins/conform"),

	require("gojira/plugins/cmp"),

	require("gojira/plugins/dracula"),

	require("gojira/plugins/treesitter"),

	require("gojira/plugins/debug"),

	require("gojira/plugins/ranger"),

	require("gojira/plugins/undotree"),

	-- require("gojira/plugins/shade"),

	require("gojira/plugins/harpoon"),

	require("gojira/plugins/mini"),

	require("gojira/plugins/fugitive"),

	require("gojira/plugins/eunuch"),

	--    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
