local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc="fuzzy find"})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc="git find"})
vim.keymap.set('n', '<leader>fc', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, {desc="content find"})
