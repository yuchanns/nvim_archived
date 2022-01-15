-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "telescope")
if not status_ok then
  return
end

local telescope = require('telescope')
telescope.setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
telescope.load_extension('fzy_native')
telescope.load_extension('neoclip')
telescope.load_extension('file_browser')
