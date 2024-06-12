return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    modes = {
      char = {
        jump_labels = true,
      },
    },
  },
  -- keys = {
  --   {
  --     'f',
  --     mode = { 'n', 'x', 'o' },
  --     function()
  --       require('flash').jump()
  --     end,
  --     desc = 'Flash',
  --   },
  --   {
  --     'F',
  --     mode = { 'n', 'x', 'o' },
  --     function()
  --       require('flash').treesitter()
  --     end,
  --     desc = 'Flash Treesitter',
  --   },
  --   {
  --     'r',
  --     mode = { 'o' },
  --     function()
  --       require('flash').remote()
  --     end,
  --     desc = 'Remote Flash',
  --   },
  --   {
  --     'R',
  --     mode = { 'x', 'o' },
  --     function()
  --       require('flash').treesitter_search()
  --     end,
  --     desc = 'Treesitter Search',
  --   },
  --   {
  --     '<C-f>',
  --     mode = { 'c' },
  --     function()
  --       require('flash').toggle()
  --     end,
  --     desc = 'Toggle Flash Search',
  --   },
  -- },
}
