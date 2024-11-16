local lualine = require('lualine')

local custom_theme = {
  normal = {
    a = { fg = '#282c34', bg = '#61afef', gui = 'bold' }, -- Mode
    b = { fg = '#abb2bf', bg = '#3e4451' }, -- Branch, Diff
    c = { fg = '#abb2bf', bg = '#1e222a' }, -- Filename
  },
  insert = {
    a = { fg = '#282c34', bg = '#98c379', gui = 'bold' },
  },
  visual = {
    a = { fg = '#282c34', bg = '#c678dd', gui = 'bold' },
  },
  replace = {
    a = { fg = '#282c34', bg = '#e06c75', gui = 'bold' },
  },
  inactive = {
    a = { fg = '#abb2bf', bg = '#1e222a' },
    b = { fg = '#abb2bf', bg = '#1e222a' },
    c = { fg = '#abb2bf', bg = '#1e222a' },
  },
}

lualine.setup {
  options = {
    theme = 'custom_theme', -- Automatically adjusts to your color scheme
    component_separators = '', -- Disable extra separators
    section_separators = { left = '', right = '' }, -- Rounded separators
    globalstatus = true, -- Shared statusline across splits
    disabled_filetypes = { 'NvimTree', 'packer' },
  },
  sections = {
    lualine_a = { { 'mode', fmt = function(str) return ' ' .. str end } }, -- Mode with icon
    -- lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_lsp' } } },
    lualine_c = { { 'filename', path = 1 } }, -- Display relative file path
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { 'nvim-tree', 'fzf', 'quickfix' },
}

