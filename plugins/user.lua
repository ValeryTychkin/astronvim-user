return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",

  {
    "AstroNvim/astrocore",
    lazy = false, -- disable lazy loading
    priority = 10000, -- load AstroCore first
    opts = {
      diagnostics = {
        -- disable diagnostics virtual text
        virtual_text = false,
      },
    }
  },

  {
      "AstroNvim/astroui",
      lazy = false, -- disable lazy loading
      priority = 10000, -- load AstroUI first
      opts = {
        -- set configuration options  as described below
      }
  },

  "ValeryTychkin/xcode-dark.nvim",

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "petertriho/nvim-scrollbar",
    opts = function(_, opts)
      require("astrocore").extend_tbl(opts, {
        handlers = {
          gitsigns = require("astrocore").is_available "gitsigns.nvim",
          search = require("astrocore").is_available "nvim-hlslens",
          ale = require("astrocore").is_available "ale",
        },
      })
    end,
    event = "User AstroFile",
    config = function ()
      require("scrollbar").setup({
            handle = {
            color = "#2E323C",
        },
            marks = {
            Search = { color = "#FF8700" },
            Error = { color = "#e95678" },
            Warn = { color = "#f7bb3b" },
            Info = { color = "#61afef" },
            Hint = { color = "#36d0e0" },
            Misc = { color = "#FFFFFF" },
          }
      })
    end
  },

  "nvimdev/zephyr-nvim",

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  {
    "stevanmilic/nvim-lspimport",
    event = "VeryLazy",
    config = function ()
      vim.keymap.set("n", "<leader>fi", require("lspimport").import, { noremap = true })
    end
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    config = function ()
      require("aerial").setup()
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>m", "<cmd>AerialToggle!<CR>")
    end
  },
}
