vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoread = true

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({"hide"})
    end
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig').rust_analyzer.setup{}
      require'lspconfig'.gopls.setup{}
      require'lspconfig'.pylsp.setup{}
      require'lspconfig'.kotlin_language_server.setup{}
    end
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "github/copilot.vim", name = "copilot.vim" },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
})

vim.opt.termguicolors = true
vim.cmd.colorscheme('catppuccin-latte')

vim.g.mapleader = ','
vim.keymap.set('n', '<leader>gf', require('fzf-lua').git_files, {})
vim.keymap.set('n', '<leader>ff', require('fzf-lua').files, {})
vim.keymap.set('n', '<leader>fg', require('fzf-lua').grep, {})
vim.keymap.set('n', '<leader>fb', require('fzf-lua').buffers, {})
vim.keymap.set('n', '<leader>fh', require('fzf-lua').tags, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern="kt",
  callback = function() 
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end
})
