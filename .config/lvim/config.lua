lvim.keys.normal_mode["<Space>"] = "<Nop>"

lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "MunifTanjim/eslint.nvim" },
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	}
}

-- General formatting options
lvim.keys.normal_mode["gf"] = function()
    vim.lsp.buf.format({ async = true })
end
lvim.keys.visual_mode["gf"] = function()
    vim.lsp.buf.format({ async = true })
end
lvim.keys.normal_mode["ga"] = function()
    vim.lsp.buf.code_action()
end

--lvim.format_on_save.enabled = true
--lvim.format_on_save.pattern = { "*.py,*.ts,*.js*,*.tsx,*.jsx,*.cjs" }
vim.opt.showtabline = 2
vim.opt.expandtab = false
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<"
vim.opt.list = true

-- Python
lvim.builtin.treesitter.ensure_installed = {
  "python",
}
require('lspconfig').ruff.setup({})

require'lspconfig'.biome.setup{}

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

-- Debugger
lvim.builtin.alpha.active = true
lvim.builtin.dap.active = true
local dap = require "dap"
dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '/usr/local/ms-vscode.cpptools-1.21.6@linux-x64/extension/debugAdapters/bin/OpenDebugAD7'
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = "Launch file with arguments",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    end,
    args = function()
      local args_string = vim.fn.input('Arguments: ')
      return vim.split(args_string, " +")
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  }
}
lvim.keys.normal_mode["<F5>"] = ":lua require'dap'.continue()<cr>"

-- nvimtree
lvim.builtin.nvimtree.setup.filters.custom = { }
