local map = vim.keymap
local tele = require('telescope.builtin')
--hot keys--
map.set('n', '<leader>ff', tele.find_files, {})
map.set('n', '<leader>fg', tele.live_grep, {})
map.set('n', '<leader>fb', tele.buffers, {})
map.set('n', '<leader>fh', tele.help_tags, {})
map.set('n', '<leader>of', tele.oldfiles, { desc = '[?] Find recently opened files' })

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
