-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "dapui")
if not status_ok then
  return
end

local dap, dapui = require("dap"), require("dapui")

dapui.setup({
  layouts = {
    { elements = { "scopes", "breakpoints", "stacks", "watches" }, size = 40, position = "right" },
  },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
