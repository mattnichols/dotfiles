return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', '<leader>hj', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end, { desc = 'Next hunk' })

          map('n', '<leader>hk', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, { desc = 'Previous hunk' })

          -- Hunks
          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
          map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'Undo hunk stage' })
          map('v', '<leader>hs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'Stage hunk (visual)' })
          map('v', '<leader>hr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'Reset hunk (visual)' })

          -- Buffers
          map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })

          -- Blame
          map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Blame line' })
          map('n', '<leader>gB', function()
            gitsigns.blame_line { full = true }
          end, { desc = 'Blame all lines' })

          -- Diff
          map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Show diff' })
          map('n', '<leader>gD', function()
            gitsigns.diffthis '~'
          end, { desc = 'Show diff' })

          -- What does this doj
          map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'Stage hunk (visual)' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Stage hunk (visual)' })
        end,
      }
    end,
  },
  --{ 'tpope/vim-fugitive' },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      --'ibhagwan/fzf-lua', -- optional
    },
    config = function()
      local neogit = require 'neogit'
      neogit.setup {}

      vim.keymap.set('n', '<leader>gs', neogit.open, { desc = 'Git status', silent = true, noremap = true })
      vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { desc = 'Git commit', silent = true, noremap = true })
      vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { desc = 'Git pull', silent = true, noremap = true })
    end,
  },
}
