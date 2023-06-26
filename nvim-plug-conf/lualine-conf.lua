local colors = {
  green  = '#a8cb76',
  -- cyan   = '#79dac8',
  black  = '#222835',
  blue   = '#81a3f1',
  red    = '#ff5189',
  -- violet = '#81a3f1',
  grey   = '#3c425f',
  purple = '#b59df1',
  yellow = "#d9b072",
}


local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.blue, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },
  insert = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.green, bg = colors.grey }
  },
  visual = {
    a = { fg = colors.black, bg = colors.purple },
    b = { fg = colors.purple, bg = colors.grey }
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    -- lualine_c = { 'fileformat' },
    -- lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  extensions = {},
}

return function(use)
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      opt = true,
    }
  }
end
