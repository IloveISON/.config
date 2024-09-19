return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",

  config = function()

  require('nvim-treesitter.install').prefer_git = false
  require("nvim-treesitter").setup({
    -- 'nvim-treesitter.install'.prefer_git = false,
    ensure_installed = { "lua", "javascript", "html", "css", "python" },
    highlignt = { enable = true },
    indent = { enable = true },
  })
end
}
