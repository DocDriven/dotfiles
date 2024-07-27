vim.o.timeout = true
vim.o.timeoutlen = 250
require("which-key").setup {}
local status, which_key = pcall(require, "which-key")
if not status then
    print("which-key is not installed")
    return
end

which_key.add({
  { "<leader>f", group = "file" },
  { "<leader>b", group = "buffer" },
  { "<leader>h", group = "harpoon" },
  { "<leader>v", group = "view" },
})

-- which_key.register({
--         b = {
--             name = "buffer",
--         },
--         f = {
--             name = "file",
--         },
--         h = {
--             name = "harpoon",
--         },
--         v = {
--             name = "view",
--         },
--     },
--     {
--         mode = "n",
--         prefix = "<leader>",
--         noremap = true,
--         nowait = true,
--     }
-- )

