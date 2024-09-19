return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",

  config = function()
  -- Set the C compilers for Treesitter (for Windows)
  require("nvim-treesitter.install").compilers = { "zig", "clang", "cl" }

  -- Treesitter configuration
  -- require'nvim-treesitter.configs'.setup {
  --   highlight = {
  --     enable = true,              -- Enable syntax highlighting
  --     disable = {},               -- List languages to disable (empty = all enabled)
  --     additional_vim_regex_highlighting = false, -- Disable regex-based highlighting
  --   },
  -- }

  require('nvim-treesitter.install').prefer_git = false
  require("nvim-treesitter").setup({
    -- 'nvim-treesitter.install'.prefer_git = false,
    ensure_installed = { "lua", "javascript", "html", "css", "python", "java", "vim", "bash", "csv", "dockerfile", "gitignore", "gitcommit", "git_config", "json", "json5", "pascal", "powershell", "pip_requirements", "sql", "yaml", "toml", "xml", "typescript" },
    highlignt = {
      enable = true,
      disable = {}, -- List languages to disaboe (empty = all enabled)
      additional_vim_regex_highlighting = false, -- Disable regex-based highlighting
    },
    indent = { enable = true },
  })
end
}
