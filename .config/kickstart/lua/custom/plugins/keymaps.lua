return {
  vim.keymap.set({ 'i', 'n' }, '<C-s><C-s>', '<cmd>silent! xa<cr><cmd>qa<cr>', { desc = 'Save all and quit' }),
}
