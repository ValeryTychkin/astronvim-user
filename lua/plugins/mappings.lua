return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<leader>bD"] = {
            function()
              require("astronvim.utils.status").heirline.buffer_picker(
                function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<leader>b"] = { name = "Buffers" },
          ["<D-v>"] = { '"+P', desc = "Paste" },
          ["U"] = { "<C-r>", desc = "Redo" },
          ["<D-z>"] = { "u", desc = "Undo" },
          ["<D-Z>"] = { "<C-r>", desc = "Redo" },

          -- window management
          ["<leader>sv"] = { "<C-w>v", desc = "split window vertically" },
          ["<leader>sh"] = { "<C-w>s", desc = "split window horizontally" },
          ["<leader>se"] = { "<C-w>=", desc = "make split windows equal width & height" },
          ["<leader>sx"] = { ":close<CR>", desc = "close current split window" },
          ["dd"] = { '"_dd', desc = "Delete without save in buffer" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          ["<D-v>"] = { '<C-\\><C-o>"+p', desc = "Paste" },
        },
        v = {
          ["<D-c>"] = { '"+y', desc = "Copy" },
          ["<D-v>"] = { '"+P', desc = "Paste" },
          ["d"] = { '"_d', desc = "Delete without save in buffer" },
        },
        c = {
          ["<D-v>"] = { "<C-R>+", desc = "Paste" },
        },
        i = {
          ["<D-v>"] = { "<C-r><C-o>+", desc = "paste" },
          ["<D-z>"] = { "<Esc>ui", desc = "Undo" },
          ["<D-Z>"] = { "<Esc><C-r>i", desc = "Redo" },
        },
      },
    },
  },
}
