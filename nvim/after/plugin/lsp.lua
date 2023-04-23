local lsp = require('lsp-zero').preset({})

lsp.preset('recommended')

lsp.ensure_installed({
    'lua_ls',
    'luau_lsp',
	'gopls',
	'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-enter>'] = cmp.mapping.confirm({ select = true }),
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
	vim.keymap.set("n",  "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n",  "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n",  "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n",  "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n",  "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n",  "<leader>vca", function() vim.diagnostic.code_action() end, opts)
	vim.keymap.set("n",  "<leader>vrr", function() vim.diagnostic.references() end, opts)
	vim.keymap.set("n",  "<leader>vrn", function() vim.diagnostic.rename() end, opts)
end)

lsp.format_on_save({
    servers = {
        ['gopls'] = {'go'}
    }
})

require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            gofumpt = true,
            staticcheck = true,
        },
    },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})


lsp.setup()

