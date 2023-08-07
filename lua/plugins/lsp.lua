-- availalbe language servers --
local servers = {
  clangd = {},
  lua_ls = {},
  pylsp = {},
  yamlls = {},
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  local map = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
  map('K', '<cmd>Lspsaga hover_doc<CR>', 'Hover Documentation')
  map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  map('<C-t>', '<cmd>Lspsaga term_toggle<CR>', 'Toggld floating [T]erminal')
  map('<F2>', '<cmd>Lspsaga outline<CR>', '[O]utline')
  map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  map('<leader>rn', '<cmd>Lspsaga rename ++project<CR>', '[R]e[n]ame')
  map('<F3>', '<cmd>Lspsaga code_action<CR>', '[C]ode [A]ction')
  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  map("<space>f", function()
    vim.lsp.buf.format { async = true }
  end, "[F]ormat code")
end

require("neodev").setup()
require("neoconf").setup()
require('lspsaga').setup()

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  handlers = {
    function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        settings = servers[server_name],
        on_attach = on_attach,
        capabilities = capabilities
      }
    end,
  }
})
