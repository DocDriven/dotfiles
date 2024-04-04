local ls = require('luasnip')

--ls.config.setup({ enable_autosnippets = false })

--vim.keymap.set({"i"}, "<C-M>", function() ls.expand() end, {silent=true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent=true})
vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump(-1) end, {silent=true})
    vim.keymap.set({"i", "s"}, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, {silent=true})

