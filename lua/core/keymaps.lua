-----neovim lua keymaps-----
vim.g.mapleader = ' '

local map = vim.keymap

map.set('i', '<leader>j', '<ESC>')

map.set('v', 'J', ":m '>+1<CR>gv=gv")
map.set('v', 'K', ":m '<-2<CR>gv=gv")

map.set('n', '<leader>sv', '<C-w>v')
map.set('n', '<leader>sh', '<C-w>s')

map.set('n', '<leader>nh', '<cmd>nohl<CR>')
map.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')
map.set('n', '<leader>s', '<cmd>write<CR>')

-- CompetiTest
map.set('n', '<leader>r', '<cmd>CompetiTest run<CR>')
map.set('n', '<leader>ra', '<cmd>CompetiTest add_testcase<CR>')
map.set('n', '<leader>R', '<cmd>CompetiTest receive testcases<CR>')
map.set('n', '<leader>d', function ()
end)

