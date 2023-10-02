local lsp = require("lsp-zero").preset("recommended")
local util = require("lspconfig.util")

lsp.on_attach(function(client, buffnr)
	lsp.default_keymaps({buffer = buffnr})
end)

lsp.ensure_installed({"eslint", "tsserver", "gopls", "lua_ls"})

require("lspconfig").tsserver.setup({
  root_dir = util.root_pattern("package.json",".git")
})

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
