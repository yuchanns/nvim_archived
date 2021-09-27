--[[ require('github-theme').setup {
    function_style = "italic",
    sidebars = {"qf", "vista_kind", "terminal", "packer"},
    colors = {hint = "orange", error = "#ff0000"},
    theme_style = "dark",
    transparent = true,
} ]]


require('lualine').setup {
    options = {
        theme = "tokyonight",
        section_separators = {"", ""},
        component_separators = {'', ''},
    },
}


local g = vim.g

g.tokyonight_transparent = false

vim.cmd[[colorscheme tokyonight]]

 -- indent-blankline
 g.indentLine_char_list = {'|', '¦', '┆', '┊'}
 g.indent_blankline_use_treesitter = true
 g.indent_blankline_show_current_context = true
 g.indent_blankline_show_first_indent_level = true
 g.indent_blankline_filetype_exclude = {
    "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
    "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
    "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
    "flutterToolsOutline", "" -- for all buffers without a file type
}
g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_current_context = true
g.indent_blankline_context_patterns = {
    "class", "function", "method", "block", "list_literal", "selector",
    "^if", "^table", "if_statement", "while", "for"
}
-- because lazy load indent-blankline so need readd this autocmd
vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')

require('bufferline').setup {
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                    or (e == "warning" and " " or "" )
                s = s .. n .. sym
            end
            return s
        end,
        custom_areas = {
            right = function()
                local result = {}
                local error = vim.lsp.diagnostic.get_count(0, [[Error]])
                local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
                local info = vim.lsp.diagnostic.get_count(0, [[Information]])
                local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

                if error ~= 0 then
                    table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
                end

                if warning ~= 0 then
                    table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
                end

                if hint ~= 0 then
                    table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
                end

                if info ~= 0 then
                    table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
                end
                return result
            end,
        },
        show_close_icon = false,
    }
}

vim.api.nvim_set_keymap('n', 'b]', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'b[', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'be', ':BufferLineSortByExtension<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bd', ':BufferLineSortByDirectory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bc', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bb', ':BufferLinePick<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fs', ':lua require(\'telescope.builtin\').lsp_dynamic_workspace_symbols()<CR>', { noremap = true })

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

require('trouble').setup()
vim.api.nvim_set_keymap('n', '<leader>xx', ':TroubleToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xw', ':TroubleToggle lsp_workspace_diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xd', ':TroubleToggle lsp_document_diagnostics<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xq', ':TroubleToggle quickfix<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>xl', ':TroubleToggle loclist<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'gR', ':TroubleToggle lsp_references<CR>', { noremap = true })

-- dashboard
g.dashboard_default_executive = 'telescope'
g.dashboard_preview_command = 'cat'
g.dashboard_preview_pipeline = 'lolcat'
g.dashboard_preview_file = '~/.config/nvim/neovim.cat'
g.dashboard_preview_file_height = 12
g.dashboard_preview_file_width = 80
vim.api.nvim_set_keymap('n', '<leader>ss', ':<C-u>SessionSave<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sl', ':<C-u>SessionLoad<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':DashboardFindHistory<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require(\'telescope.builtin\').file_browser()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tc', ':DashboardChangeColorscheme<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fa', ':DashboardFindWord<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':DashboardJumpMark<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cn', ':DashboardNewFile<CR>', { noremap = true, silent = true })

-- treesitter context
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
}

vim.cmd("let &fcs='eob: '")

