-----neovim lua keymaps-----
vim.g.mapleader = ' '

local map = vim.keymap
local mappings = {
  -- Normal
  { from = '<leader>j',  to = '<ESC>',                                  mode = 'i' },
  { from = 'J',          to = ":m '>+1<CR>gv=gv",                       mode = 'v' },
  { from = 'K',          to = ":m '<-2<CR>gv=gv",                       mode = 'v' },
  { from = '<leader>sv', to = '<C-w>v',                                 mode = 'n' },
  { from = '<leader>sh', to = '<C-w>h',                                 mode = 'n' },
  { from = '<leader>nh', to = '<cmd>nohl<CR>',                          mode = 'n' },
  { from = '<leader>e',  to = '<cmd>NvimTreeToggle<CR>',                mode = 'n' },
  { from = '<leader>s',  to = '<cmd>write<CR>',                         mode = { 'n', 'v' } },
  { from = '<F1>',       to = '<cmd>Dashboard<CR>',                     mode = { 'n', 'v', 'i' } },
  -- CompetiTest
  { from = '<F5>',       to = '<cmd>CompetiTest run<CR>',               mode = 'n' },
  { from = '<leader>ra', to = '<cmd>CompetiTest add_testcase<CR>',      mode = 'n' },
  { from = '<leader>R',  to = '<cmd>CompetiTest receive testcases<CR>', mode = 'n' },
  { from = '<leader>d',  to = 'CompetiTest delete_testcase',            mode = 'n' },
  -- True-zen
  { from = '<leader>zf', to = '<cmd>TZFocus<CR>',                       mode = 'n' },
  { from = '<leader>zm', to = '<cmd>TZMinimalist<CR>',                  mode = 'n' },
  { from = '<leader>za', to = '<cmd>TZAtaraxis<CR>',                    mode = 'n' },
}

for _, mapping in ipairs(mappings) do
  map.set(mapping.mode, mapping.from, mapping.to, { noremap = true })
end
