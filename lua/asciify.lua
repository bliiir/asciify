local M = {}

M.asciify = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in ipairs(lines) do
        lines[i] = line:gsub("[^\0-\x7F]", "?")
    end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

M.setup = function()
    vim.api.nvim_create_user_command(
        'Asciify', 
        function()
            M.asciify()
        end, 
        {
            desc='Replace non-Ascii characters with Ascii equivalents'
        }
    )
end

return M
