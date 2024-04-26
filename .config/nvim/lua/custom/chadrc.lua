---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.ui = {
    theme = "catppuccin",
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.opt.relativenumber = false
return M
