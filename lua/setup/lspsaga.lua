-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "lspsaga")
if not status_ok then
	return
end

require("lspsaga").init_lsp_saga({ move_in_saga = { prev = "k", next = "j" } })
