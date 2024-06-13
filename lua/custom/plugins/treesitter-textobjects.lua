return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  lazy = true,
  config = function()
    require('nvim-treesitter.configs').setup {
      --   textobjects = {
      --     -- syntax-aware textobjects
      --     enable = true,
      --     lsp_interop = {
      --       enable = true,
      --       peek_definition_code = {
      --         ['Df'] = '@function.outer',
      --         ['DF'] = '@class.outer',
      --       },
      --     },
      --     keymaps = {
      --       ['iL'] = {
      --         -- you can define your own textobjects directly here
      --         go = '(function_definition) @function',
      --       },
      --       -- or you use the queries from supported languages with textobjects.scm
      --       ['af'] = '@function.outer',
      --       ['if'] = '@function.inner',
      --       ['aC'] = '@class.outer',
      --       ['iC'] = '@class.inner',
      --       ['ac'] = '@conditional.outer',
      --       ['ic'] = '@conditional.inner',
      --       ['ae'] = '@block.outer',
      --       ['ie'] = '@block.inner',
      --       ['al'] = '@loop.outer',
      --       ['il'] = '@loop.inner',
      --       ['is'] = '@statement.inner',
      --       ['as'] = '@statement.outer',
      --       ['ad'] = '@comment.outer',
      --       ['am'] = '@call.outer',
      --       ['im'] = '@call.inner',
      --     },
      --     move = {
      --       enable = true,
      --       set_jumps = true, -- whether to set jumps in the jumplist
      --       goto_next_start = {
      --         [']m'] = '@function.outer',
      --         [']]'] = '@class.outer',
      --       },
      --       goto_next_end = {
      --         [']M'] = '@function.outer',
      --         [']['] = '@class.outer',
      --       },
      --       goto_previous_start = {
      --         ['[m'] = '@function.outer',
      --         ['[['] = '@class.outer',
      --       },
      --       goto_previous_end = {
      --         ['[M'] = '@function.outer',
      --         ['[]'] = '@class.outer',
      --       },
      --     },
      --     select = {
      --       enable = true,
      --       lookahead = true,
      --       keymaps = {
      --         -- You can use the capture groups defined in textobjects.scm
      --         ['af'] = '@function.outer',
      --         ['if'] = '@function.inner',
      --         ['ac'] = '@class.outer',
      --         ['ic'] = '@class.inner',
      --         -- Or you can define your own textobjects like this
      --         ['iF'] = {
      --           python = '(function_definition) @function',
      --           cpp = '(function_definition) @function',
      --           c = '(function_definition) @function',
      --           java = '(method_declaration) @function',
      --           go = '(method_declaration) @function',
      --         },
      --       },
      --     },
      --     swap = {
      --       enable = true,
      --       swap_next = {
      --         ['<leader>a'] = '@parameter.inner',
      --       },
      --       swap_previous = {
      --         ['<leader>A'] = '@parameter.inner',
      --       },
      --     },
      --   },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
            ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
            ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
            ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },
            ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter' },
            ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter' },
            ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
            ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },
            ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
            ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },
            ['af'] = { query = '@call.outer', desc = 'Select outer part of a funciton call' },
            ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },
            ['am'] = { query = '@function.outer', desc = 'Select outer part of a method/function call' },
            ['im'] = { query = '@function.inner', desc = 'Select inner part of a method/function call' },
            ['ac'] = { query = '@class.outer', desc = 'Select outer part of class' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of class' },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
            ['<leader>nm'] = '@parameter.outer', -- swap function with next
          },
          swap_previous = {
            ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
            ['<leader>pm'] = '@parameter.inner', -- swap function with prev
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = { query = '@call.outer', desc = 'Next function call start' },
            [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
            [']c'] = { query = '@class.outer', desc = 'Next class start' },
            [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
            [']l'] = { query = '@loop.outer', desc = 'Next loop start' },

            -- You can pass query group to use query from 'queries/<lang>/<query_group>.dvm gilr in your runtime path.
            -- Below example nvim-treesitter's 'locals.scm' and 'folds.scm'.  The also proved highlights.scm and indent.scm.
            [']s'] = { query = '@scope', query_group = 'locals', desc = 'Next scope' },
            [']z'] = { query = '@fold', query_group = 'folds', desc = 'Next fold' },
          },
          goto_next_end = {
            [']F'] = { query = '@call.outer', desc = 'Next function call end' },
            [']M'] = { query = '@function.outer', desc = 'Next method/function call end' },
            [']C'] = { query = '@class.outer', desc = 'Next class end' },
            [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
            [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
          },
          goto_previous_start = {
            ['[f'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[m'] = { query = '@function.outer', desc = 'Prev method/function call end' },
            ['[c'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['[l'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
          goto_previous_end = {
            ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
            ['[M'] = { query = '@function.outer', desc = 'Prev method/function call end' },
            ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
            ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
            ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
          },
        },
      },
    }

    local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

    -- vim way: ; goes to the direction you were moving.
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    -- Already handled by flash.nvim
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
    -- vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
    -- vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)
  end,
}
