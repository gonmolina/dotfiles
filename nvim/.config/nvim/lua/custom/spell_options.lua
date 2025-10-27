-- Función para activar/desactivar spell check
vim.api.nvim_create_user_command("ToggleSpell", function()
	vim.opt.spell = not vim.opt.spell:get()
	if vim.opt.spell:get() then
		print("Corrección ortográfica activada")
	else
		print("Corrección ortográfica desactivada")
	end
end, {})

-- Atajo de teclado para activar/desactivar (por ejemplo, <leader>s)
vim.keymap.set("n", "<leader>s", ":ToggleSpell<CR>", { noremap = true, silent = true, desc = "Toggle spell check" })

-- Configurar los idiomas que quieres usar
vim.opt.spelllang = { "es_ar", "es", "en_us" } -- Español e inglés

-- Activar solo español
vim.keymap.set("n", "<leader>sa", function()
	vim.opt.spell = true
	vim.opt.spelllang = { "es", "es_ar" }
	print("Spell check spanish activated")
end, { desc = "Spell check spanish" })

-- Activar solo inglés
vim.keymap.set("n", "<leader>se", function()
	vim.opt.spell = true
	vim.opt.spelllang = "en_us"
	print("Spell check english activated")
end, { desc = "Spell check english" })

-- Activar ambos idiomas
vim.keymap.set("n", "<leader>sb", function()
	vim.opt.spell = true
	vim.opt.spelllang = { "es", "es_ar", "en_us" }
	print("Spell check spanish/english activated")
end, { desc = "Spell check sp/en" })

-- Desactivar
vim.keymap.set("n", "<leader>so", function()
	vim.opt.spell = false
	print("Corrección ortográfica desactivada")
end, { desc = "Spell check off" })
