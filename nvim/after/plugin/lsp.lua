local lsp = require("lsp-zero").preset("recommended")
lsp.on_attach(function(client, buffnr)
	lsp.default_keymaps({buffer = buffnr})
end)

lsp.ensure_installed({"eslint", "tsserver", "gopls", "lua_ls"})

lsp.setup()
