return {
  'pocco81/auto-save.nvim',
  config = function()
    require('auto-save').setup()
    vim.keymap.set('n', '<leader>at', ':ASToggle<CR>', { desc = '(T)oggle auto-save' })
  end,
}
