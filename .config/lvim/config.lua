lvim.keys.normal_mode["<Space>"] = "<Nop>"

lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
}

-- Python
lvim.builtin.treesitter.ensure_installed = {
  "python",
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

lvim.colorscheme = "catppuccin-mocha"
