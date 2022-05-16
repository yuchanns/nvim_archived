-- Use a protected call so we don't error out on first use
local status_ok, fmt = pcall(require, "shfmt")
if not status_ok then
  return
end

fmt.setup({
  args = { "-l", "-w", "-i 4" },
  auto_format = true,
})
