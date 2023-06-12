if vim.g.neovide then
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.0
  vim.g.neovide_background_color = "#00000" .. alpha()
  vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14" -- text below applies for VimScript
  vim.g.neovide_refresh_rate = 75 
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_hide_mouse_when_typing = true

-- Set current working dir to root projects folder
--  vim.api.nvim_create_autocmd("VimEnter", {
--    pattern = '*',
--    command = "cd $HOME/Proyectos/"
--  })
end
