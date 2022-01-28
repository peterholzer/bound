
function bind(f, g)
    return function(x)
        return g(f(x))
    end
end

debug.setmetatable(function() end, {
    __shr = function(f, g)
        return bind(f, g)
    end
})

function a(x)
    return '<'..x..'>'
end

function b(x)
    return '('..x..')'
end

function c(x)
    return '['..x..']'
end


print(c(b(a('m'))))


print(bind(a, b)('m'))


local bound = a >> b >> c >> print

bound('n')
