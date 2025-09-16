local dap, dapui = require "dap", require "dapui"
dapui.setup()

dap.listeners.after.event_initialized["dapui_auto"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_auto"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_auto"] = function()
  dapui.close()
end
