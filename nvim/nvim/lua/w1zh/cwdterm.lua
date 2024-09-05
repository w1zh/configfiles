-- Define a function to change the terminal's directory
local function ChangeTerminalDirectory()
    vim.api.nvim_command('cd %:p:h') -- Change the working directory to the directory of the current file
end

-- Set the mapping to call the function
vim.api.nvim_set_keymap('t', '<c-\\>', '<cmd>lua ChangeTerminalDirectory()<CR>', { noremap = true, silent = true })

return {
    ChangeTerminalDirectory = ChangeTerminalDirectory
}

