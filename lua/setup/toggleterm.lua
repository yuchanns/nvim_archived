-- Use a protected call so we don"t error out on first use
local status_ok, _ = pcall(require, "toggleterm")
if not status_ok then
  return
end

local Terminal = require("toggleterm.terminal").Terminal
local wk_ok, wk = pcall(require, "which-key")
if vim.fn.executable("lazygit") > 0 and wk_ok then
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    function _lazygit_toggle()
        lazygit:toggle()
    end
    wk.register({ ["<leader>l"] = { "<Cmd>lua _lazygit_toggle()<CR>", "Toggle Lazygit", noremap = true, silent = true, mode = "n" } })
end
