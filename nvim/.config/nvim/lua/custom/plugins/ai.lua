return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
		event = { "BufReadPost", "BufNewFile" },
		enabled = true,
		keys = {
			{
				"<leader>la",
				"<cmd>CodeCompanionActions<cr>",
				desc = "Code Companion Actions",
			},
			{
				"<leader>ll",
				"<cmd>CodeCompanionChat<cr>",
				desc = "Chat with Selected Text",
				mode = { "n", "v" },
			},
			{
				"<leader>le",
				"<cmd>CodeCompanion /explain<cr>",
				desc = "Explain Selected Text",
				mode = { "v" },
			},
			{
				"<leader>lf",
				"<cmd>CodeCompanion /fix<cr>",
				desc = "Fix Selected Text",
				mode = { "v" },
			},
			{
				"<leader>lt",
				"<cmd>CodeCompanion /tests<cr>",
				desc = "Generate Test Selected Text",
				mode = { "n", "v" },
			},
			{
				"<leader>lc",
				"<cmd>CodeCompanion /commit<cr>",
				desc = "Generate Test Selected",
				mode = { "v" },
			},
			{
				"<leader>ls",
				"<cmd>CodeCompanion /lsp<cr>",
				desc = "Explain the LSP diagnostic ",
				mode = { "v" },
			},
			{
				"<leader>lk",
				"<cmd>CodeCompanion Add<cr>",
				desc = "CodeCompanionChat Add",
				mode = { "v" },
			},
		},
		config = function()
			require("codecompanion").setup({
				-- 1. Configuración de los Adaptadores (Gemini 3)
				adapters = {
					gemini = function()
						return require("codecompanion.adapters").extend("gemini", {
							env = {
								api_key = "GEMINI_API_KEY", -- Debe estar en tu .zshrc o .bashrc
							},
							schema = {
								model = {
									default = "gemini-3.1-pro-preview", -- El cerebro más potente disponible
								},
								parameters = {
									max_output_tokens = { default = 8192 },
									temperature = { default = 0.25 }, -- Bajo para código más preciso
								},
							},
						})
					end,
				},

				-- 2. Estrategias de uso
				strategies = {
					chat = {
						adapter = "gemini",
						keymaps = {
							send = { modes = { n = "<CR>", i = "<C-s>" } }, -- Enter para enviar en normal, Ctrl+s en insert
							close = { modes = { n = "q" } },
						},
					},
					inline = { adapter = "gemini" },
					agent = {
						adapter = "gemini",
						tools = {
							["files"] = { callback = "require('codecompanion.strategies.chat.tools.files')" },
							["terminal"] = { callback = "require('codecompanion.strategies.chat.tools.terminal')" },
						},
					},
				},

				-- 3. Interfaz Visual
				display = {
					chat = {
						window = {
							layout = "vertical", -- "float", "vertical" o "horizontal"
							width = 0.35,
						},
					},
				},
			})
		end,
	},
}
