return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    enabled = true,
    config = function()
      vim.o.background = 'dark'
      vim.cmd [[colorscheme gruvbox]]
    end,
  },
}
