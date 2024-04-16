-- See `:help gitsigns` to understand what the configuration keys do
return {
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      local opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }
      require('gitsigns').setup(opts)

      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>')
      vim.keymap.set('n', '<leader>gn', ':Gitsigns next_hunk<CR>')
      vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>')
    end,
  },
  { 'tpope/vim-fugitive' },
}
