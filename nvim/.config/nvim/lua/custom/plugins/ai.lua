return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"viespejo/cc-adapter-gemini-code-assist.nvim",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				http = {
					gemini_code_assist = function()
						return require("codecompanion.adapters").extend("gemini-code-assist", {
							env = {
								-- Leave project_id nil or unset for Zero Config (Individual OAuth2)
							},
						})
					end,
				},
			},
			strategies = {
				chat = {
					adapter = "gemini_code_assist",
				},
				inline = {
					adapter = "gemini_code_assist",
				},
				agent = {
					adapter = "gemini_code_assist",
				},
			},
		})

		-- Force load the adapter so that user commands (like :CodeCompanionGeminiAuth) are registered immediately
		pcall(require, "codecompanion.adapters.http.gemini-code-assist")
	end,
}
