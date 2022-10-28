local util = require("fish_abbr.util")
local compiled = vim.fn.resolve(vim.fn.stdpath("cache") .. "/" .. "fish_abbr_compiled.vim")
local fish_script = vim.fn.stdpath("data") .. "/abbr_show.fish"

local M = {}

M.compile = function()
    require("fish_abbr.util").compile(compiled, fish_script)
end

M.setup = function()
    if not util.exists(fish_script) then
        local file = assert(io.open(fish_script, "w"))
        file:write("abbr --show")
        file:close()
    end

    if not util.exists(compiled) then
        M.compile()
    end

    vim.cmd('source ' .. compiled)
end

return M
