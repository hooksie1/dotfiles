local lsp = require('lsp-zero').preset({})

lsp.preset('recommended')

lsp.ensure_installed({
    'lua_ls',
    'luau_lsp',
	'gopls',
	'rust_analyzer',
    'zls',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n",  "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end, opts)
    vim.keymap.set('n', "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end, opts)
    vim.keymap.set('n', "<leader>wl", function() vim.inspect(vim.lsp.buf.list_workspace_folders()) end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n",  "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n",  "]d", function() vim.diagnostic.goto_prev() end, opts)
end)

lsp.format_on_save({
    servers = {
        ['null-ls'] = {'go'}
    }
})

lsp.setup()

local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.goimports,
    }
})
