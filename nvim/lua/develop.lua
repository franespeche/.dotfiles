function OpenPopup(message)
    -- Create a new scratch buffer for the popup content
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, {message})
    -- Create a new floating window with the buffer
    local opts = {
        style = 'minimal',
        relative = 'editor',
        width = #message + 4,
        height = 3,
        row = 2,
        col = vim.fn.winwidth(0) - #message - 6,
        border = 'single',
    }
    local win = vim.api.nvim_open_win(buffer, true, opts)
    -- Close the popup after a delay (you can customize the delay)
    vim.defer_fn(function()
        vim.api.nvim_win_close(win, true)
    end, 20000)
end

OpenPopup('hola')
