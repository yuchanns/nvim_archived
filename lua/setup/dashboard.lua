-- Use a protected call so we don't error out on first use
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

math.randomseed(os.time())
-- local colors = { "white", "violet", "lightyellow", "#7ba2f7" }
local colors = { "#7ba2f7", "#9b348e", "#db627c", "#fda17d", "#86bbd8", "#33648a" }
local function random_colors(color_lst)
  return color_lst[math.random(1, #color_lst)]
end
vim.cmd(string.format("highlight dashboard guifg=%s guibg=bg", random_colors(colors)))

local dashboard = require("alpha.themes.dashboard")
local header = {
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⠌⠐⠁⠘⠂⠙⡀⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠌⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⠲⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠤⠤⠀⠀⢠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⠈⣦⢮⡀⠀⢀⣤⣄⠀⢀⣠⡀⠀⠀⠀⠀⠀⠸⣶⡄⠀⠀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠘⢣⠀⠀⡅⣼⣻⢿⣚⣟⡻⠀⢸⡟⡟⢠⣤⣄⣀⠐⢍⠙⣿⡆⠁⠀⠀⠈⠠⡀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⢸⠔⠊⠙⡻⠈⠉⠛⡿⠳⡶⡶⠛⠉⠉⠻⣻⠗⢽⣶⡰⠁⠀⠀⠀⠀⠀⠀⢱⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣅⣦⠞⠁⠀⠀⠀⢇⠘⢿⡦⡇⠁⠀⠳⢖⠞⠁⣼⠉⠀⠙⠋⠁⠀⠠⠄⠁⡄⠀⠀⢭⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡨⠇⠒⠒⠢⢤⡀⠀⠁⠒⠃⠀⠀⠀⠀⠉⠈⣉⣀⣀⣀⡀⠀⠀⠀⠀⠀⡰⠁⠀⣮⠎⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠖⠁⠀⠀⠀⠀⠀⠀⠈⠢⡀⠀⠀⠀⠀⠀⡠⠒⠉⠀⠀⠀⠀⠉⠑⠦⡀⠀⠀⢠⡤⠟⠉⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⠀⠀⠀⢠⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⡄⠀⠈⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢱⠀⠀⣸⣿⣷⣶⣤⡀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀⠀⠀⣰⣶⣦⠀⢀⡞⠀⠀⠀⡇⠀⢀⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⡘⠀⠀⢺⣿⣿⣿⣿⣿⣷⣄⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠔⠙⢆⡀⠀⠀⠀⠀⠈⠓⢁⡠⠊⣀⣀⡀⠀⠱⡀⠘⠽⠿⠃⠀⠀⠀⠀⠀⠀⡰⠁⠀⢈⣻⣿⣿⣿⣿⣿⣿⣿⣧⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠉⠒⠒⠲⠖⠒⠊⠁⠔⠚⠿⠿⠗⢄⠀⠙⠢⢄⣀⠀⠀⠀⢀⣀⠤⠊⠀⠀⠀⠀⢽⣿⣿⣿⣿⣿⣿⣿⣿⣇]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠒⠢⢄⠠⠀⠀⠀⠀⠀⠈⠉⠉⠁⠀⠀⠀⠀⠀⠀⢐⢿⣿⣿⣿⣿⡟⠈⣿⠀⢸]],
  [[⠀⠀⣀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠈⡆⠀⠠⠒⠒⠂⠀⠤⠤⠀⢀⣀⡀⠀⠢⠤⠤⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣽⣿⣿⣿⣿⣿⣾⣟⣶⣾]],
  [[⢠⠰⢶⣿⣿⣿⣿⣿⠿⢖⣰⣄⣠⡀⢈⡢⣀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠐⠒⠢⠤⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟]],
  [[⠈⡏⢹⣶⣶⣶⠀⠀⣿⣿⡏⠀⣸⠇⡎⠀⠑⢢⠀⠀⠀⠀⠀⣠⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⣑⣼⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀]],
  [[⠀⢳⠈⣿⣿⡏⠀⢸⣿⣿⠶⠛⠁⠀⠈⠒⣢⣼⠀⠀⠀⠀⠀⣿⠀⠀⠉⠸⣆⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⢀⠴⠒⠒⢲⡀⣻⣻⣌⢹⣿⣿⣿⣿⠿⣻⠟⠋⠀⠀]],
  [[⠀⠘⢤⣿⣿⣇⣀⣼⡿⠟⠀⠀⠀⠀⢠⠊⠁⠀⡇⠀⠀⠀⠀⠹⡢⠄⠀⣤⡿⠀⠀⠀⠀⠀⠀⠘⠢⠤⠤⠊⠀⢀⣤⡴⠷⠁⣻⣻⢸⠙⡿⠿⠟⠉⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⢀⠇⠀⠀⠀⠈⠐⣄⠀⠀⠀⠈⠁⠀⠋⠁⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠛⠛⢛⠿⠋⠀⠀⠐⡄⣿⢀⠃⠰⠀⠀⠀⠀⠀⠀⠀]],
  [[⠄⠀⠀⠀⠀⠀⠀⠠⠤⠄⠀⡉⠀⠙⡄⠀⠀⠀⠀⠀⠈⠓⠲⠦⢤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⣀⣠⣀⢀⠠⠂⠁⠀⠀⠀⠀⠀⢴⡇⡌⠀⠂⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⠀⠘⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠈⠛⠉⠓⠒⠒⠊⠉⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⡽⡜⠀⠌⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣦⣀⣸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠈⠁⣄⠀⠀⠀⠀⠀⣴⣿⣿⣎⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⢀⠊⠀⠀⢠⡏⠀⡀⣀⣴⣾⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣦⣤⡌⠀⣀⣴⣧⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀]],
  [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀]],
}

dashboard.section.header.val = header
dashboard.section.header.opts.hl = "dashboard"

dashboard.section.buttons.val = {
  dashboard.button("cn", "  New File       ", ":enew<CR>", nil),
  dashboard.button("ff", "  Browse File    ", ":lua require('vfiler').start()<CR>", nil),
  dashboard.button(
    "fa",
    "  Find Word      ",
    ":lua require('telescope.builtin').live_grep()<CR>",
    nil
  ),
  dashboard.button(
    "fh",
    "  Find History   ",
    ":lua require('telescope.builtin').oldfiles()<CR>",
    nil
  ),
}

alpha.setup(dashboard.opts)
