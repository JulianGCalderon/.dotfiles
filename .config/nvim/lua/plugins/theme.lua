return {
  {
    'catppuccin/nvim',
    name = "catppuccin",
    priority = 1000,
    config = function(_)
      require("catppuccin").setup({})
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'catppuccin',
        component_separators = '|',
        section_separators = '',
        globalstatus = "true",
      },
    },
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    enabled = false,
    main = 'ibl',
    opts = {},
  },
}
