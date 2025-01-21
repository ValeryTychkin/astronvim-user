-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- "rust",
      -- add more arguments for adding more treesitter parsers
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "markdown" }, -- list of language that will be disabled
    },
  },
}
