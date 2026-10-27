-- (1°C × 9/5) + 32 = 33.8°F

function celsiusToFahrenheit(celsius)
    return round((celsius * 9/5) + 32)
end

-- (32°F − 32) × 5/9 = 0°C
function fahrenheitToCelsius(fahrenheit)
    return round((fahrenheit - 32) * 5/9)
end

function round(num)
    return math.floor(num + 0.5)
end

io.write([[Pick a conversion type: 
A) C to F 
B) F to C
Choice: ]])
local conversionType = io.read()
if conversionType:lower() == "a" then
    io.write("Enter temperature in Celsius: ")
    local celsius = tonumber(io.read())
    if celsius then
        local fahrenheit = celsiusToFahrenheit(celsius)
        print(celsius .. " celcius is equal to " .. fahrenheit .. " around fehrenheit")
    else
        print("Invalid input. Please enter a valid number.")
    end
elseif conversionType:lower() == "b" then
    io.write("Enter temperature in Fahrenheit: ")
    local fahrenheit = tonumber(io.read())
    if fahrenheit then
        local celsius = fahrenheitToCelsius(fahrenheit)
        print(fahrenheit .. " fehrenheit is equal to " .. celsius .. " around celcius")
    else
        print("Invalid input. Please enter a valid number.")
    end
else
    print("Invalid input. Please enter 'A' or 'B'.")
end