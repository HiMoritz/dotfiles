local lsp = require("lsp-zero").preset("recommended")
local util = require("lspconfig.util")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.on_attach(function(client, buffnr)
	lsp.default_keymaps({buffer = buffnr})
end)

lsp.ensure_installed({"eslint", "tsserver", "gopls", "lua_ls"})

require("lspconfig").tsserver.setup({
  root_dir = util.root_pattern("package.json",".git")
})

require("lspconfig").emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "html", ".html.tpl", ".html.templ", "smarty" }
})

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' }
  })
})
