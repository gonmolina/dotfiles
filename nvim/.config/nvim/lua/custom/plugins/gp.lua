local function get_google_oauth_token()
	-- Usamos 'print-access-token' a secas para extraer el token de tu login de usuario
	local handle = io.popen("gcloud auth print-access-token 2>/dev/null")
	if not handle then
		return nil
	end

	local result = handle:read("*a")
	handle:close()

	if result then
		result = result:gsub("%s+", "")
		if result ~= "" then
			return result
		end
	end
	return nil
end

return {
	"Robitx/gp.nvim",
	enabled = false,
	config = function()
		require("gp").setup({
			providers = {
				gemini = {
					-- Mantenemos el endpoint directo de AI Studio
					endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro:streamGenerateContent",
					secret = function()
						return get_google_oauth_token()
					end,
				},
			},
			agents = {
				{
					name = "GeminiCoder",
					chat = true,
					command = true,
					model = { model = "gemini-1.5-pro" },
					system_prompt = "Sos un ingeniero de software experto. Ayudame a escribir código limpio y eficiente.",
				},
			},
		})

		-- Atajos de teclado
		vim.keymap.set("v", "<leader>ai", ":<C-u>'<,'>GpImplement<CR>", { desc = "Implementar con IA" })
		vim.keymap.set("v", "<leader>ap", ":<C-u>'<,'>GpChatPaste<CR>", { desc = "Pegar selección al chat de IA" })
		vim.keymap.set("n", "<leader>ac", "<cmd>GpChatToggle vsplit<CR>", { desc = "Toggle Chat de IA" })
	end,
}
