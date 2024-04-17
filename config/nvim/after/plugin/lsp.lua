local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'clangd',
    'lua_ls',
    'pyright',
    'dockerls',
    'bashls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-j>'] = cmp.mapping.confirm(cmp_select),
    ['<C-Space>'] = cmp.mapping.complete(cmp_select),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    -- lsp.buffer_autoformat()
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', '<leader>a', function() vim.lsp.buf.format() end, { buffer = bufnr, remap = false, desc = "autoformat"})
    vim.keymap.set('n', 'D', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'I', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>vs', function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false, desc = "symbols (workspace)"})
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = "diagnostics window"})
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>va', function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "actions"})
    vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc = "references"})
    vim.keymap.set('n', 'R', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

-- LSP for C/C++
require('lspconfig').clangd.setup({
    cmd = { 'clangd', '--background-index', '--compile-commands-dir=.' },
    filetypes = { 'c', 'cpp' },
    root_dir = require('lspconfig.util').root_pattern('.clangd', 'compile_commands.json'),
})
