io.write("What year were you born in: ")
local year = tonumber(io.read())
io.write("What month were you born in (1-12): ")
local month = tonumber(io.read())
io.write("What day were you born in (1-31): ")
local day = tonumber(io.read())

function calculateAge(year, month, day)
    local currentYear = tonumber(os.date("%Y"))
    local currentMonth = tonumber(os.date("%m"))
    local currentDay = tonumber(os.date("%d"))

    local age = currentYear - year

    if month > currentMonth or (month == currentMonth and day > currentDay) then
        age = age - 1
    end

    return age
end

io.write("You are " .. calculateAge(year, month, day) .. " years old.")