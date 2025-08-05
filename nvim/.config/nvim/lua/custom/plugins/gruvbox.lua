return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		enabled = false,
		config = function()
			vim.o.background = "dark"
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
