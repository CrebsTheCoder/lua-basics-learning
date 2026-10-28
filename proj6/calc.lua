io.write("Enter the first number: ")
local num1 = tonumber(io.read())
io.write("Enter the second number: ")
local num2 = tonumber(io.read())
io.write("Enter the operation (+, -, *, /): ")
local operation = io.read()

function calculate(num1, num2, operation)
    if operation == "+" then
        return num1 + num2
    elseif operation == "-" then
        return num1 - num2
    elseif operation == "*" then
        return num1 * num2
    elseif operation == "/" then
        if num2 ~= 0 then
            return num1 / num2
        else
            return "can't devide by zero lah"
        end
    else
        return "dis not an option lah"
    end
end

print("Result: " .. calculate(num1, num2, operation))