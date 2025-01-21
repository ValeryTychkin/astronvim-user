-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo(
    { { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } },
    true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

if vim.g.neovide then
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_animation_length = 0.07
  vim.g.neovide_input_macos_alt_is_meta = true
  vim.g.neovide_input_use_logo = 1
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_scroll_animation_length = 0
end

-- Turn off virtual text (LSP)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})

require("cmp").setup {
  sources = {
    { name = "nvim_lsp" },
  },
}
