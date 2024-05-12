---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.ui = {
    theme = "catppuccin",
    changed_themes = {
      catppuccin = {
        base_16 = {
          base02 = "#135564",
        },
      },
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.opt.relativenumber = false
return M
