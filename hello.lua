function hello()
    print("hello world")

    print("I still can't feel what's special with Lua :(")

    return 1, 2, 3
end

function add(...)
    local s = 0
    for i, v ipairs {...} do
        s = s + v
    end
    return s
end
print(add(1,2,3,4,5,6))
--print(hello(), 4)
