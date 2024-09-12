vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("colorscheme evening")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


vim.g.mapleader = ' '
-- vim.keymap.set('n', '<leader>p', ':tabprevious<CR>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>n', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>y', '"+yy<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ss', ':mksession! ~/session.vim<CR>', { noremap = true, silent = true })  -- Save session
vim.keymap.set('n', '<leader>sl', ':source ~/session.vim<CR>', { noremap = true, silent = true })      -- Load session

require("config.lazy")
-- require('lualine').setup()
require'nvim-web-devicons'.get_icons( { default = true } )
require('mini.pairs').setup()
require('mini.hipatterns').setup()
-- require('mini.icons').setup()
require('mini.indentscope').setup()
require('mini.notify').setup()
require('mini.starter').setup()
-- require('mini.statusline').setup()
require('mini.tabline').setup({
    show_icons = true,  -- Ensure icons are enabled
    icons = {
        file = '',  -- Default file icon
        modified = '',  -- Modified file icon
    }
})
require('mini.sessions').setup()
