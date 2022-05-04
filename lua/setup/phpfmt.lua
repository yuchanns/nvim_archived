local cbf_root_path = vim.fn.stdpath("data") .. "/lspconfig/PHP_CodeSniffer"
local cbf_binary = cbf_root_path .. "/bin/phpcbf"

if vim.fn.executable(cbf_binary) > 0 then
  local function php_fmt()
    if vim.bo.filetype ~= "php" then
      return
    end
    local buf_nr = vim.api.nvim_get_current_buf()
    local file_path = vim.api.nvim_buf_get_name(buf_nr)
    local view = vim.fn.winsaveview()
    local cmd = cbf_binary .. " --standard=PSR12 --encoding=utf8 " .. file_path
    vim.fn.jobstart(cmd, {
      on_exit = function(_, code, _)
        if code == 0 or code == 1 then
          vim.api.nvim_exec("edit", true)
          vim.fn.winrestview(view)
        end
      end,
      on_stderr = function(_, data, _)
        if #data == 0 or #data[1] == 0 then
          return
        end
        local results = "File is not formatted due to error.\n" .. table.concat(data, "\n")
        vim.notify("PHPFormat " .. results, vim.log.levels.WARN)
      end,
    })
  end
  local augroup = "PHPFmt"
  vim.api.nvim_create_augroup(augroup, {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
      pcall(php_fmt)
    end,
  })
end
