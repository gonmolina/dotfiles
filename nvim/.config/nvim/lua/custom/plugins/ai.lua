return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
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
		-- Cargar secrets
		local ok, secrets = pcall(require, "secrets")
		if not ok then
			vim.notify("Error: No se pudo cargar secrets.lua", vim.log.levels.ERROR)
			return
		end

		require("codecompanion").setup({
			strategies = {
				chat = { adapter = "gemini" },
				inline = { adapter = "copilot" },
				agent = { adapter = "gemini" },
			},
			adapters = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						env = {
							api_key = secrets.GEMINI_API_KEY, -- Usar desde archivo
						},
						schema = {
							model = {
								default = "gemini-1.5-flash",
								choices = {
									"gemini-1.5-flash",
									"gemini-1.5-pro",
								},
							},
						},
					})
				end,
			},
			display = {
				chat = {
					window = {
						layout = "vertical",
						width = 0.45,
						height = 0.8,
					},
				},
			},
			opts = {
				log_level = "ERROR",
				send_code = true,
			},
		})
	end,
}
