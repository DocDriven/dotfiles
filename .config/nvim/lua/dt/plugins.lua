local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

-- Reload neovim after whenever you save plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <file> | PackerSync
  augroup END
]])

packer.startup(function(use)

    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Keymap overview
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 250
            require("which-key").setup {
            }
        end
    }

    -- Colorschemes and stuff
    use("folke/tokyonight.nvim")
    use("sunjon/shade.nvim") -- dim inactive windows

    use("itchyny/lightline.vim") -- fancy status line


    -- NERDTree
    use("preservim/nerdtree")
    use("Xuyuanp/nerdtree-git-plugin")

    -- Ranger
    use("francoiscabrol/ranger.vim")

    -- Telescope (fuzzy finder)
    use {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"}, { "BurntSushi/ripgrep" } } -- must have ripgrep installed locally
    }
    use { 
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
    use("nvim-treesitter/nvim-treesitter")
    use("sharkdp/fd")
    -- use("nvim-tree/nvim-web-devicons")


    -- Delete buffers without closing windows
    use("rbgrouleff/bclose.vim")

    -- Linters and Auto-completion
    use("dense-analysis/ale")
    use {
        "Shougo/deoplete.nvim",
        run = ":UpdateRemotePlugins",
    }

    -- Add UNIX file operations like rename, chmod, etc.
    use("tpope/vim-eunuch")

    if packer_boostrap then
        packer.sync()
    end

end)

