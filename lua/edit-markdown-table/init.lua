local M = {}

M.setup = function()
    vim.cmd([[ command! EditMarkdownTable lua require('edit-markdown-table').edit_cell() ]])
end

--- Opens a dialog to edit the cell within the markdown table
--- located within the current cursor.
M.edit_cell = function()
    local node = vim.treesitter.get_node()
    if node == nil then
        return
    end

    local node_type = node:type()
    if node_type ~= "pipe_table_cell" and node_type ~= "pipe_table_header" then
        return
    end

    local current_buffer_number = 0
    local current_contents = vim.treesitter.get_node_text(node, current_buffer_number)

    vim.ui.input({
        prompt = "edit>",
        default = current_contents,
    }, function(input)
        -- if the user presses esc
        if input == nil then
            return
        end

        local start_row, start_col, end_row, end_col = node:range()
        vim.api.nvim_buf_set_text(current_buffer_number, start_row, start_col, end_row, end_col, { input })
    end)
end

return M
