
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
        return g(f(...))
    end
end




debug.setmetatable(function() end, {
    __shr = bind2,
    __shr = function(f, g)
        return function(...)
            return call_each(bind2(f, g), ...)
        end
    end,
})



local bound = a >> b >> c >> d >> print

bound('l', 'm', 'n')


