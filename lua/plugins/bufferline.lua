-- press numbers to navigate --
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, function() require('bufferline').go_to_buffer(i, true) end)
end
-- navigate to previous or next --
vim.keymap.set('n', '<leader>h', '<Cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>l', '<Cmd>BufferLineCycleNext<CR>')

vim.keymap.set('n', '<leader>x', function()
  if vim.bo.modified then
    vim.cmd.write()
  end
  local buf = vim.fn.bufnr()
  require('bufferline').cycle(-1)
  vim.cmd.bdelete(buf)
end)


require('bufferline').setup {
  options = {
    diagnostics = 'nvim_lsp',
    separator_style = 'slope',
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },

    custom_areas = {
      right = function()
        local result = {}
        local seve = vim.diagnostic.severity
        local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
        local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
        local info = #vim.diagnostic.get(0, {severity = seve.INFO})
        local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

        if error ~= 0 then
          table.insert(result, {text = '  ' .. error, fg = '#EC5241'})
        end

        if warning ~= 0 then
          table.insert(result, {text = '  ' .. warning, fg = '#EFB839'})
        end

        if hint ~= 0 then
          table.insert(result, {text = '  ' .. hint, fg = '#A3BA5E'})
        end

        if info ~= 0 then
          table.insert(result, {text = '  ' .. info, fg = '#7EA9A7'})
        end
        return result
      end,
    },

    offsets = {{
      filetype = 'NvimTree',
      text = ' Finder',
      highlight = 'Directory',
      text_align = 'left'
    }}
  }
}

