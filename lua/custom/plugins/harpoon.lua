return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = false,
      },
    }

    vim.keymap.set('n', '<leader>m', function()
      harpoon:list():add()
    end, { desc = 'Add harpoon mark' })
    vim.keymap.set('n', '<M-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Toggle Harpoon' })

    vim.keymap.set('n', '<M-u>', function()
      harpoon:list():select(1)
    end, { desc = 'Toggle Harpoon File 1' })
    vim.keymap.set('n', '<M-i>', function()
      harpoon:list():select(2)
    end, { desc = 'Toggle Harpoon File 2' })
    vim.keymap.set('n', '<M-o>', function()
      harpoon:list():select(3)
    end, { desc = 'Toggle Harpoon File 3' })
    vim.keymap.set('n', '<M-p>', function()
      harpoon:list():select(4)
    end, { desc = 'Toggle Harpoon File 4' })

    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():prev()
    end, { desc = 'Toggle Harpoon Previous' })
    vim.keymap.set('n', '<C-m>', function()
      harpoon:list():next()
    end, { desc = 'Toggle Harpoon Next' })

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in pairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>sh', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
  end,
}
