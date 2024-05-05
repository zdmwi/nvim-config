-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
--
local colors = {
  color_bg="brightblack",
  color_fg="#98a3ad",
  color_fg_active="#98a3ad",
  color_green="#98c379",
  color_yellow="#e5c07b",
  color_red="#e06c75",
  color_blue="#61afef",
  color_cyan="#56b6c2",
  color_purple="#c678dd",
  color_gray="#5c6370",
  color_buffer="#939aa3",
  color_selection="#3e4452",
  color_light_gray="#5c6370",

  blue   = '#80a0ff',
  cyan   = '#88c0d0',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local theme = {
  normal = {
    a = { fg = colors.grey, bg = colors.cyan },
    b = { fg = colors.color_fg, bg = colors.grey },
    c = { fg = colors.color_fg },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.color_fg, bg = colors.color_bg },
    b = { fg = colors.color_fg, bg = colors.color_bg },
    c = { fg = colors.color_fg },
  },
}
--
return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
          require('lualine').setup({
            options = {
              theme = theme,
              component_separators = '',
              section_separators = { left = "" },
            },
            sections = {
              lualine_a = { { 'mode', right_padding = 2 } },
              lualine_b = { 'filename', 'branch' },
              lualine_c = {
                '%=', --[[ add your center compoentnts here in place of this comment ]]
              },
              lualine_x = {},
              lualine_y = { 'filetype', 'progress' },
              lualine_z = {
                { 'location', left_padding = 2 },
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
            tabline = {},
            extensions = {},
          })
        end
    }
}
