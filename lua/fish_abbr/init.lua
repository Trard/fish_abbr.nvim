local util = require("fish_abbr.util")
local compiled = vim.fn.resolve(vim.fn.stdpath("cache") .. "/" .. "fish_abbr_compiled.vim")
local get_abbrs = "echo abbr --show | /bin/fish"

require("fish_abbr.command")

local M = {}

M.compile = function()
    require("fish_abbr.util").compile(compiled, get_abbrs)
end

M.setup = function()
    if not util.exists(compiled) then
        M.compile()
    end

    vim.cmd('source ' .. compiled)
end

return M
