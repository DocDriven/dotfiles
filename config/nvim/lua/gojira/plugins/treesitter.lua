  return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup({
          ensure_installed = { 'bash', 'c', 'lua', 'vim', 'vimdoc' },
          -- Autoinstall languages that are not installed
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  }
}
-- vim: ts=2 sts=2 sw=2 et
