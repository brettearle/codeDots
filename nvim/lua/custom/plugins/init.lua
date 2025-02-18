-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    on_attach = function()
      local root_dir = require('lspconfig.util').root_pattern 'package.json'
      local active_clients = vim.lsp.get_active_clients()
      if root_dir then
        for _, client in pairs(active_clients) do
          -- stop tsserver if denols is already active
          if client.name == 'denols' then
            client.stop()
          end
          if client.name == 'svelte-language-server' then
            client.stop()
          end
        end
      end
    end,
  },
  { 'github/copilot.vim' },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      direction = 'vertical',
    },
  },
}
