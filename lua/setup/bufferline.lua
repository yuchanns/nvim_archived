-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "bufferline")
if not status_ok then
  return
end

require("bufferline").setup({
  options = {
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    custom_areas = {
      right = function()
        local result = {}
        local error = vim.diagnostic.get(0, [[Error]])
        local warning = vim.diagnostic.get(0, [[Warning]])
        local info = vim.diagnostic.get(0, [[Information]])
        local hint = vim.diagnostic.get(0, [[Hint]])

        if error ~= 0 then
          table.insert(result, { text = "  " .. error, guifg = "#EC5241" })
        end

        if warning ~= 0 then
          table.insert(result, { text = "  " .. warning, guifg = "#EFB839" })
        end

        if hint ~= 0 then
          table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" })
        end

        if info ~= 0 then
          table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" })
        end
        return result
      end,
    },
    show_close_icon = false,
    offsets = {},
  },
})
