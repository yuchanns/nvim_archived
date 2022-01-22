-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require('illuminate').on_attach(client)
  require('lsp_signature').on_attach(client)
  require('aerial').on_attach(client)
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- local opts = { noremap=true, silent=true }
  --[[ buf_set_keymap('n', '<leader>a', '<cmd>AerialToggle! left<CR>', {})
  buf_set_keymap('n', '{', '<cmd>AerialPrev<CR>', {})
  buf_set_keymap('n', '}', '<cmd>AerialNext<CR>', {})
  buf_set_keymap('n', '<leader>w', '<cmd>AerialTreeToggle!<CR>', {}) ]]
  -- See `:help vim.lsp.*` for documentation on any of the below functions
end

-- golang
nvim_lsp["gopls"].setup {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    gopls = {
      analyses = { composites = false }
    }
  }
}

require('go').setup {
    auto_format = true,
    auto_lint = true,
    linter = 'revive',
    lint_prompt_style = 'vt',
    formatter = 'goimports',
}

-- rust
local rust_tools_opt = {
  server = {
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
}

require('rust-tools').setup(rust_tools_opt)
vim.g.rustfmt_autosave = 1

-- lua
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('data')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp["sumneko_lua"].setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- php
vim.cmd('autocmd FileType php set iskeyword+=$')
local phpactor_root_path = vim.fn.stdpath('data')..'/lspconfig/phpactor'
local phpactor_binary = phpactor_root_path.."/bin/phpactor"
nvim_lsp["phpactor"].setup {
    on_attach = on_attach,
    cmd = {phpactor_binary, "language-server", "-vvv"}
}
