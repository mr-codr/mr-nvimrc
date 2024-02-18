local colorscheme = "tokyonight-night"

local success = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
