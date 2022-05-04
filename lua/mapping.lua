local api = vim.api
local g = vim.g

g.mapleader = " "

api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })

function _G.reload_nvim_conf()
  for name, _ in pairs(package.loaded) do
    if
      name:match("^setup")
      or name:match("^mapping")
      or name:match("^plugins")
      or name:match("^options")
    then
      package.loaded[name] = nil
      print(name)
    end
  end

  local ok, loadall = pcall(require, "load-all")
  if ok then
    loadall(os.getenv("HOME") .. "/.config/nvim/lua/setup")
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
