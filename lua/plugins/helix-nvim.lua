return
    {
    'oneslash/helix-nvim', version = "*",
    lazy = false,
    priority = 1000,

    config = function()
      require("cyberdream").setup()
      -- vim.cmd.colorscheme "helix"
      end

    }

