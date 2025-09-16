return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

   {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(s)
        return s ~= "rust_analyzer"
      end, opts.ensure_installed or {})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- на всякий случай не конфигурируем RA тут вообще
      if opts.servers then opts.servers.rust_analyzer = nil end
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
    lazy = false,
  },
  -- отдельный плагин-спек
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = { ensure_installed = { "codelldb" }, automatic_installation = true },
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
    dependencies = { "mfussenegger/nvim-dap", "nvim-dap-ui" },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
