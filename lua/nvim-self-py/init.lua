function P(text)
        print(vim.inspect(text))
end

function Split(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

local M = {}
-- [[
-- take cursor line in current buffer, x
-- check if its __init__ func,
-- take its parameters, 
-- auto insetrt them into that function
-- --]]

M.get_args = function ()
        local line = vim.api.nvim_get_current_line()
        if string.find(line, "def __init__") then
                line = line:gsub("  ", "")
                local format = string.sub(line,14,string.len(line) - 2)
                format =Split(format, ",")
                local args = {}
                for _, word in ipairs(format) do
                        local w = word:gsub(" ", "")
                        table.insert(args, w)
                end
                table.remove(args, 1)
                return args
        end
        return nil
end

M.add_self  = function (args)
        local self = {}
        for  _, arg in pairs(args) do
                local a = "        self." .. arg .. " = " .. arg
                table.insert(self, a)
        end
        return self
end

M.output_to_buf = function (data)
        local buf = vim.api.nvim_get_current_buf()
        local current_cursor_pos, _= vim.api.nvim_win_get_cursor(0)
        local row= current_cursor_pos[1]
        vim.api.nvim_buf_set_lines(buf , row, row , true, {data})
end

M.autoself = function ()
        local args = M.get_args()
        if args == nil then
                print("not __init__ func")
                return
        end
        local self = M.add_self(args)
        for _, s in pairs(self) do
                M.output_to_buf(s)
        end
end

M.autoself()


return M
