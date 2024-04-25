local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function ()
      require('leap').add_default_mappings()
    end
  },
}
return plugins
