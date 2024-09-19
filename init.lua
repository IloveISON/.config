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


-- Setting <Left Alt> key
vim.api.nvim_set_keymap('n', '<A-h>', ':echo "Alt+H pressed"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':echo "Leader key testing"<CR>', { noremap = true, silent = true })

-- Remap Alt+w to behave like Ctrl+w
vim.api.nvim_set_keymap('n', '<A-w>', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-u>', '<C-u>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-d>', '<C-d>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-e>', '<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-y>', '<C-y>', { noremap = true, silent = true })

-- Alt + w followed by h, j, k, l to navigate between splits
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-->', '<C-w>-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-+>', '<C-w>+', { noremap = true, silent = true })

-- Alt+w and other window-related commands
vim.api.nvim_set_keymap('n', '<A-v>', '<C-w>v', { noremap = true, silent = true })  -- Split vertically
vim.api.nvim_set_keymap('n', '<A-s>', '<C-w>s', { noremap = true, silent = true })  -- Split horizontally



vim.keymap.set('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true }) -- Hide search result highliting
vim.keymap.set('n', '<leader>ss', ':mksession! ~/session.vim<CR>', { noremap = true, silent = true })  -- Save session
vim.keymap.set('n', '<leader>sl', ':source ~/session.vim<CR>', { noremap = true, silent = true })      -- Load session

-- Barbar plugin hotkeys
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', { noremap = true, silent = true}) -- Close buffer command

require("config.lazy")
-- require('lualine').setup()
-- require'nvim-web-devicons'.get_icons( { default = true } )
require'nvim-web-devicons'.setup(
    { default = true }
    )
require('mini.pairs').setup()
require('mini.hipatterns').setup()
-- require('mini.icons').setup()
-- require('mini.indentscope').setup()
require('mini.notify').setup()
-- require('mini.starter').setup()
-- require('mini.statusline').setup()
-- require('mini.tabline').setup({
--     show_icons = true,  -- Ensure icons are enabled
--     icons = {
--         file = '',  -- Default file icon
--         modified = '',  -- Modified file icon
--     }
-- })
require('mini.sessions').setup()
-- require("nvim-treesitter.install".compilers = { "zig", "clang", "cl" }) -- The C compilers for Treesitter (Windows)

require('telescope').load_extension 'remote-sshfs' -- Loading SSH exstension
