local status, which_key = pcall(require, "which-key")
if not status then
    print("which-key is not installed")
    return
end

local opts = {
    mode = "n",
    prefix = "<leader>",
    noremap = true,
    nowait = true,
}

local mappings = {
    ["w"] = { "<CMD>wqall!<CR>", "quit" },
    ["t"] = { "<CMD>NERDTree<CR>", "nerdtree" },
    ["r"] = { "<CMD>Ranger<CR>", "ranger" },
    f = {
        name = "file", -- group name
        f = { "<CMD>Telescope find_files hidden=true<CR>", "find file" },
        b = { "<CMD>Telescope buffers<CR>", "show buffers" },
        g = { "<CMD>Telescope live_grep<CR>", "grep" },
    },
    b = {
        name = "buffers",
        d = { "<CMD>Bclose<CR>", "close buffer" },
    },
}

which_key.register(mappings, opts)

