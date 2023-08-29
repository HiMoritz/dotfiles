local Terminal = require("toggleterm.terminal").Terminal

local _lazygit = nil
_G._toggle_lazygit = function()
	if vim.fn.executable("lazygit") == 1 then
		if not _lazygit then
			_lazygit = require("toggleterm.terminal").Terminal:new({
				cmd = "lazygit",
				direction = "float",
				close_on_exit = true,
				hidden = true,
			})
		end
		_lazygit:toggle()
	else
            print("lazygit not available in path")
	end
end
vim.keymap.set("n", "<leader>gg", function() _toggle_lazygit() end)
