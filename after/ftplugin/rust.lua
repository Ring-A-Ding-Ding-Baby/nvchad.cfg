-- Работает, если стоит rustaceanvim
local ok, _ = pcall(require, "rustaceanvim")
if not ok then
  return
end

local map = vim.keymap.set
local o = { buffer = 0, silent = true, noremap = true }

-- Тесты/запуски/дебаг из rustaceanvim
map(
  "n",
  "<leader>rt",
  "<cmd>RustLsp testables<CR>",
  vim.tbl_extend("force", o, { desc = "Rust: Testables (run tests)" })
)
map("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", vim.tbl_extend("force", o, { desc = "Rust: Runnables (run)" }))

-- На случай, если захочешь обычный cargo test без пикеров:
-- map("n", "<leader>rT", "<cmd>!cargo test<CR>", vim.tbl_extend("force", o, { desc = "Rust: cargo test (file/project)" }))
