local M = {}

M.asciify = function()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in ipairs(lines) do
        lines[i] = line:gsub("[^\0-\x7F]", "?")
    end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

return M
