-- Use a protected call so we don't error out on first use
local status_ok, vfiler_config = pcall(require, "vfiler/config")
if not status_ok then
  return
end

vfiler_config.setup({
  options = {
    auto_cd = true,
    auto_resize = true,
    keep = true,
    layout = "floating",
    columns = "indent,devicons,name,mode,size,time",
    listed = false,
    blend = 30,
  },
})
