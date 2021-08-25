-- key
vim.api.nvim_set_keymap('n', 'ga', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', ':lua require(\'telescope.builtin\').lsp_implementations()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gs', ':lua vim.lsp.buf.document_symbo<CR>', { noremap = true, silent = true })
-- treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        max_file_lines = 1000,
    }
}

-- lspsaga
require('lspsaga').init_lsp_saga()

vim.api.nvim_set_keymap('n', '<leader>ca', ':lua require(\'lspsaga.codeaction\').code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>ca', ':lua require(\'lspsaga.codeaction\').range_code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gh', ':lua require\'lspsaga.provider\'.lsp_finder()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', ':lua require(\'lspsaga.hover\').render_hover_doc()<CR>', { noremap = true, silent = true })

require("lsp-colors").setup()

-- lsp compe
vim.o.completeopt = "menuone,noselect"

require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

-- lspconfig
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require('illuminate').on_attach(client)
  require('lsp_signature').on_attach(client)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
end

-- golang
nvim_lsp["gopls"].setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

require('go').setup {
    auto_format = true,
    auto_lint = true,
    linter = 'revive',
    lint_prompt_style = 'vt',
    formatter = 'goimports',
}

-- rust
nvim_lsp["rust_analyzer"].setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  assist = {
    importMergeBehavior = "last",
    importPrefix = "by_self",
  },
  diagnostics = {
    disabled = { "unresolved-import" }
  },
  cargo = {
    loadOutDirsFromCheck = true
  },
  procMacro = {
    enable = true
  },
  checkOnSave = {
    command = "clippy"
  },
}
require('rust-tools').setup()
