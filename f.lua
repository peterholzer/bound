

-- Append multiple arguments to a table
local function table_append(t, ...)
    for i = 1, select('#', ...) do
        table.insert(t, (select(i, ...))) -- extra braces needed
    end
end

-- Call a function once for each argument
function call_each(f, ...)
    print('call_each', f, ...)
    local result = {}
    for i = 1, select('#', ...) do
        table_append(result, f((select(i, ...)))) -- extra braces needed
    end
    return table.unpack(result)
end

-- Return a function that calls f for each argument
-- and calls g for each return value of f
-- and returns a flat list
function bind2(f, g)
    return function(...)
        return call_each(g, call_each(f, ...))
    end
end

-- Overload bitwise right shift operator for functions
debug.setmetatable(function() end, {
    __shr = bind2,
})






function a(x)
    return '('..x..'1'..')', '('..x..'2'..')'
end

function b(x)
    return '['..x..']'
end

function c(x)
    return '{'..x..'}'
end

function d(x)
    return '<'..x..'>'
end







local bound = a >> b >> c >> d >> print

bound('l', 'm', 'n')

-- print   <{[(l1)]}>
-- print   <{[(l2)]}>
-- print   <{[(m1)]}>
-- print   <{[(m2)]}>
-- print   <{[(n1)]}>
-- print   <{[(n2)]}>




