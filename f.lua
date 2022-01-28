
function call_each(f, ...)
    local result = {}
    for _,v in ipairs{...} do
        local tmp = f(v)
        if tmp then
            table.insert(result, tmp)
        end
    end
    return table.unpack(result)
end

call_each(print, 'a', 'b', 'c', 'd')


