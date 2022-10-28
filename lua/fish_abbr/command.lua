local command = vim.api.nvim_create_user_command

command("FishAbbrCompile", function()
	require("fish_abbr").compile()
end, {})
