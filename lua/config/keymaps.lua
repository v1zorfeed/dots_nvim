-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- БУФЕРЫ (bufferline)
----------------------------------------------------------
-- Следующий / предыдущий буфер
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Переход к конкретному положению (1-9)
-- Для цифр 1-9
for i = 1, 9 do
  map("n", "<C-" .. i .. ">", "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
end
-- Для 0 (обычно последний буфер)
map("n", "<C-0>", "<Cmd>BufferLineGoToBuffer 10<CR>", opts)
-- Закрытие буфера
map("n", "<C-d>", ":bdelete!<CR>", opts)
map("n", "<leader>bd", ":bdelete!<CR>", opts)
