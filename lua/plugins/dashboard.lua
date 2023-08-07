require('dashboard').setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      {
        desc = '󰚰 Update',
        group = '@property',
        action = function()
          vim.cmd('PackerSync')
        end,
        key = 'u'
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = '󰔎 ',
        desc = 'Themes',
        group = 'Label',
        action = 'Telescope colorscheme',
        key = 't',
      },
      {
        icon = '󰘳 ',
        desc = 'Keymaps',
        group = 'Label',
        action = 'Telescope keymaps',
        key = 'm',
      },
    },
  },
})
