return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = function()
      local function set_cwd_to_current_file_directory()
        local current_file = vim.api.nvim_buf_get_name(0) -- Obtiene el nombre del búfer actual
        if current_file ~= '' then
          local current_file_path = vim.fn.expand(current_file) -- Expande la ruta del archivo
          local current_file_directory = vim.fn.fnamemodify(current_file_path, ':h') -- Extrae el directorio
          vim.cmd('cd ' .. vim.fn.escape(current_file_directory, ' ')) -- Cambia el directorio de trabajo
        end
      end
      local neogit = require 'neogit'
      neogit.setup {}
      vim.keymap.set('n', '<leader>gs', ':Neogit cwd=%:p:h<CR>', { silent = true, noremap = true })

      vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, noremap = true })

      vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { silent = true, noremap = true })

      vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { silent = true, noremap = true })

      vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, noremap = true })

      vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true })
    end,
  },
}
