-- boostrapping
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


-- install packets
return require('packer').startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Provide icons
    use("nvim-tree/nvim-web-devicons")
    use("echasnovski/mini.icons")

    -- Keymap overview
   use("folke/which-key.nvim")

    -- Colorschemes and stuff
    use("folke/tokyonight.nvim")
    use("sunjon/shade.nvim")     -- dim inactive windows
    use("itchyny/lightline.vim") -- fancy status line

    -- Ranger
    use("rbgrouleff/bclose.vim")         -- dependency
    use("francoiscabrol/ranger.vim")

    -- Telescope (fuzzy finder)
    use {
        "nvim-telescope/telescope.nvim", branch = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" }, { "BurntSushi/ripgrep" } } -- must have ripgrep installed locally
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }

    -- Add UNIX file operations like rename, chmod, etc.
    use("tpope/vim-eunuch")

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-commentary')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip',
              tag = "v2.*",
              run = "make install_jsregexp"
            },     -- Required
        }
    }
    if packer_boostrap then
        require('packer').sync()
    end
end)
