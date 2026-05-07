-- tree-sitter playground configuration for lazy.nvim
return {
	{
		"nvim-treesitter/playground",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor", "TSNodeUnderCursor" },
		keys = {
			{ "<leader>tp", "<cmd>TSPlaygroundToggle<CR>", desc = "Toggle Tree-sitter Playground" },
			{ "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>", desc = "Show Highlight Captures" },
			{ "<leader>tn", "<cmd>TSNodeUnderCursor<CR>", desc = "Show Node Under Cursor" },
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = false,
					disable = {},
					updatetime = 25,
					persist_queries = false,
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = { "BufWrite", "CursorHold" },
				},
			})
		end,
	},
}
