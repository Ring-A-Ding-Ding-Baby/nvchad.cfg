require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Глобальные хоткеи под DAP (если плагин есть)
local ok, dap = pcall(require, "dap")
if not ok then
  return
end

local o = { silent = true, noremap = true }

map("n", "<F5>", dap.continue, vim.tbl_extend("force", o, { desc = "DAP: Continue/Start" }))
map("n", "<leader>dr", dap.repl.toggle, vim.tbl_extend("force", o, { desc = "DAP: REPL" }))
map("n", "<leader>dq", dap.terminate, vim.tbl_extend("force", o, { desc = "DAP: Terminate" }))
map("n", "<leader>dl", dap.run_last, vim.tbl_extend("force", o, { desc = "DAP: Run Last" }))
map("n", "<F8>", function()
  vim.ui.input({ prompt = "Condition: " }, function(cond)
    if cond and #cond > 0 then
      dap.set_breakpoint(cond)
    end
  end)
end, vim.tbl_extend("force", o, { desc = "DAP: Conditional Breakpoint" }))
map("n", "<F9>", dap.toggle_breakpoint, vim.tbl_extend("force", o, { desc = "DAP: Toggle Breakpoint" }))
map("n", "<F10>", dap.step_over, vim.tbl_extend("force", o, { desc = "DAP: Step Over" }))
map("n", "<F11>", dap.step_into, vim.tbl_extend("force", o, { desc = "DAP: Step Into" }))
map("n", "<F12>", dap.step_out, vim.tbl_extend("force", o, { desc = "DAP: Step Out" }))


map("n", "<leader>dL", function()
  vim.ui.input({ prompt = "Log message: " }, function(msg)
    if msg and #msg > 0 then
      dap.set_breakpoint(nil, nil, msg)
    end
  end)
end, vim.tbl_extend("force", o, { desc = "DAP: Logpoint" }))

