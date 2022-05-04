-- Use a protected call so we don't error out on first use
local status_ok, phpfmt = pcall(require, "phpfmt")
if not status_ok then
  return
end

local root_path = vim.fn.stdpath("data") .. "/lspconfig/PHP_CodeSniffer"
local binary = root_path .. "/bin/phpcbf"

phpfmt.setup({
  cmd = binary,
  auto_format = true,
})
