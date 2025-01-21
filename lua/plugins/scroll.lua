return {
  {
    "karb94/neoscroll.nvim",
    event = "BufRead",
    config = function ()
      require('neoscroll').setup {
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      }
    end
  },
  {
    "petertriho/nvim-scrollbar",
    event = "User AstroFile",
    opts = function(_, opts)
      require("astrocore").extend_tbl(opts, {
        handlers = {
          gitsigns = require("astrocore").is_available "gitsigns.nvim",
          search = require("astrocore").is_available "nvim-hlslens",
          ale = require("astrocore").is_available "ale",
        },
      })
    end,
    config = function ()
      require("scrollbar.handlers.gitsigns").setup()

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
    end,
  },
}
