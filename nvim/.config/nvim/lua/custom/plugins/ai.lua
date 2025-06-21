return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    vim.keymap.set('i', '<C-c>', '<Esc>')
    require('codecompanion').setup {
      adapters = {
        deepseek = function()
          return require('codecompanion.adapters').extend('deepseek', {
            env = {
              api_key = '',
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = 'copilot' },
        inline = { adapter = 'copilot' },
        agent = { adapter = 'copilot' },
      },
    }
  end,
}
