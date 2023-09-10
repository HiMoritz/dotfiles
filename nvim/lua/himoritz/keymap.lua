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
