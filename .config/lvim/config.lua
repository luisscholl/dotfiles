lvim.keys.normal_mode["<Space>"] = "<Nop>"

lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "MunifTanjim/eslint.nvim" }
}

-- General formatting options
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py,*.ts,*.js*,*.tsx,*.jsx" }

-- Python
lvim.builtin.treesitter.ensure_installed = {
  "python",
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

-- colorscheme
lvim.colorscheme = "catppuccin-mocha"

-- Eslint
local null_ls = require("null-ls")
local eslint = require("eslint")

null_ls.setup()

eslint.setup({
  bin = 'eslint', -- or `eslint_d`
  code_actions = {
    enable = true,
    apply_on_save = {
      enable = true,
      types = { "directive", "problem", "suggestion", "layout" },
    },
    disable_rule_comment = {
      enable = true,
      location = "separate_line", -- or `same_line`
    },
  },
  diagnostics = {
    enable = true,
    report_unused_disable_directives = false,
    run_on = "type", -- or `save`
  },
})
