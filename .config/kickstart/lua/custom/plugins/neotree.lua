return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },
      open_files_do_not_replace_types = { 'terminal', 'Trouble', 'qf', 'Outline' },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignore = false,
        },
        window = {
          mappings = {
            ['.'] = 'toggle_hidden',
            ['l'] = 'open',
            ['P'] = 'focus_preview',
            ['H'] = 'set_root',
          },
        },
      },
      window = {
        mappings = {
          ['.'] = 'toggle_hidden', -- For testing This dont belong here
          ['<space>'] = 'none',
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
    }
    vim.cmd [[nnoremap \ :Neotree toggle<cr>]]
  end,
}
