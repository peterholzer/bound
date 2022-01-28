
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

-- call_each(print, 'a', 'b', 'c', 'd')



function bind2(f, g)
    return function(...)
        return call_each(g, call_each(f, ...))
    end
end



debug.setmetatable(function() end, {
    __shr = bind2,
})








function a(x)
    return '('..x..')'
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

-- print   <{[(l)]}>
-- print   <{[(m)]}>
-- print   <{[(n)]}>




