-- Place for custom keymaps

vim.keymap.set("n", "<leader>gg", function()
        _toggle_lazygit()
end)

vim.keymap.set("n", "<leader>nr", function() 
        _toggle_relative_lines()
end)

vim.keymap.set("n", "<leader>F", function ()
  vim.lsp.buf.format() 
end)

vim.keymap.set("n", "<leader>ca", function ()
  vim.lsp.buf.code_action()
end)
