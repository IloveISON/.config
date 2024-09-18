return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        priority = 15,
        style = {
            { fg = "#ED764D" },
            { fg = "#c21f30" },
        },
        use_treesitter = true,
        chars = {
          horizontal_line = "-",
          vertical_line = "|",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
        -- animation related
        duration = 200,
        delay = 300,
      },
      indent = {
        enable = false,
        priority = 10,
        chars = {
              " ",
            },
        style = {
              { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
          },
        exclude_filetype = exclude_ft,


        -- style = { vim.api.nvim_get_hl(0, { name = "Whitespace" }) },
        use_treesitter = false,
        -- chars = { "│" },
        -- ahead_lines = 5,
        -- delay = 100,
      },
      line_num = {
        enable = true,
        priority = 10,
        style = "#E95420",
      },
      blank = {
        enable = true,
      },
      context = {
        enable = false,
      },
    })
  end
}
