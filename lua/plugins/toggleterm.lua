-- Detect the operating system
local uname = vim.loop.os_uname().sysname

-- Set the default shell based on the operating system
local shell
if uname == "Windows_NT" then
  shell = "powershell.exe"  -- Use PowerShell for Windows
else
  shell = vim.o.shell  -- Use the default shell for other OS (bash, zsh, etc.)
end


-- -- Function to execute the current Python file
-- function _RUN_PYTHON_FILE()
--   -- Open a terminal if it's not already open, then run the file
--   local file = vim.fn.expand("%")  -- Get the current file path
--   vim.cmd("TermExec cmd='python " .. file .. "'")  -- Run Python command in the terminal
-- end

-- Function to execute the current file based on its filetype
-- function _RUN_CURRENT_FILE()
_G._RUN_CURRENT_FILE = function()

  -- Debugging: Check the current file and print it in Neovim
  -- if file == "" then
  --   print("No file found. Please open and save the file.")
  --   return
  -- else
  --   print("Running file: " .. file)
  -- end


  local file = vim.fn.expand("%:p") -- Get the full path of the current file
  local filetype = vim.bo.filetype   -- Get the file type of the current buffer

 -- Check if the file path is valid
  if file == "" or file == nil then
    print("No valid file found. Please open or save the file before running.")
    return
  else
    print("Running file: " .. file) -- Debugging message to check file path
  end

  -- Check if the file path is valid and the buffer is writable
  if file == "" or vim.bo.modified then
    print("Please save the file before running")
    return
  end

  -- Detect the file type and run the appropriate command
  if filetype == "python" then
    vim.cmd("TermExec cmd='python " .. file .. "'")
  elseif filetype == "javascript" then
    vim.cmd("TermExec cmd='node " .. file .. "'")
  else
    print("No run command defined for this file type: " .. filetype)
  end
end


-- Key mapping to execute the current Python file
vim.api.nvim_set_keymap('n', '<leader>rp', ':lua _RUN_CURRENT_FILE()<CR>', { noremap = true, silent = true })


return
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = true,

      config = function()
require("toggleterm").setup{
      shell = shell,
      size = 10,         -- Height of the terminal window
      open_mapping = [[<c-\>]],  -- Mapping to toggle the terminal window
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal",  -- Can be "horizontal", "vertical", "float"
      close_on_exit = true,       -- Close the terminal window when the process exits
    }
    end
  }
