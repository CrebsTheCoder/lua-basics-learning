io.write("Enter a number: ")
local num1 = tonumber(io.read())

for i = 1, 12 do
    print(num1 .. " x " .. i .. " = " .. (num1 * i))
end