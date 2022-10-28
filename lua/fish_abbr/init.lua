local fish_script = vim.fn.stdpath("data") .. "/abbr_show.fish"

local function cabbr(abbreviation, command)
    vim.cmd.cabbrev(table.concat({
        "<expr>",
        abbreviation,
        "getcmdline()[0] == '!' ?",
        "'" .. command .. "'", ":", "'" .. abbreviation .. "'"
    }, " "))
end

local handle = assert(io.popen("/bin/fish " .. fish_script, "r"))

local abbreviations = handle:read("*all")
handle:close()

for line in string.gmatch(abbreviations, "[^\n]+") do
    local abbr, command = string.match(line, "abbr.*%-%- (%S+) (.+)")

    if string.sub(command, 1, 1) == "'" and string.sub(command, -1, -1) == "'" then
        command = string.sub(command, 2, -2)
    end

    cabbr(abbr, command)
end

local function setup() end

return { setup = setup }
