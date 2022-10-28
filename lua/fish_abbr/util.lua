local M = {}

M.exists = function(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function cabbrev_value(abbreviation, command)
	return table.concat({
		"<expr>",
		abbreviation,
		"getcmdline()[0] == '!' ?",
		"'" .. command .. "'",
		":",
		"'" .. abbreviation .. "'",
	}, " ")
end

M.compile = function(compiled_path, fish_script)
	local fish_script_file = assert(io.popen("/bin/fish " .. fish_script, "r"))

	local abbreviations = fish_script_file:read("*all")
	fish_script_file:close()

    local compiled = assert(io.open(compiled_path, 'w'))

    for line in string.gmatch(abbreviations, "[^\n]+") do
		local abbr, command = string.match(line, "abbr.*%-%- (%S+) (.+)")

		if string.sub(command, 1, 1) == "'" and string.sub(command, -1, -1) == "'" then
			command = string.sub(command, 2, -2)
		end

		compiled:write("cabbrev " .. cabbrev_value(abbr, command).. "\n")
	end

    compiled:close()
end

return M
