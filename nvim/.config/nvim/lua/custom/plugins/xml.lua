return {
	-- 1. Resaltado de sintaxis superior
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "xml" })
			end
		end,
	},

	-- 2. Servidor de Lenguaje (LSP) para autocompletado y validación
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				-- Requiere tener instalado 'lemminx' (LazyVim lo hará vía Mason)
				lemminx = {},
			},
		},
	},

	-- 3. Formateo automático al guardar
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				-- Usa xmlformatter o xmllint (debes instalarlos vía :Mason)
				xml = { "xmlformatter" },
			},
		},
	},
}
