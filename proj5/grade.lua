io.write("Enter your grade: ")
local grade = tonumber(io.read())

if grade >= 80 then
    print("You got an A+!")
elseif grade >= 75 then
    print("You got a A-!")
elseif grade >= 70 then
    print("You got a B+!")
elseif grade >= 65 then
    print("You got a B-!")
elseif grade >= 60 then
    print("You got a C+!")
elseif grade >= 55 then
    print("You got a C-!")
elseif grade >= 50 then
    print("You got a D+!")
elseif grade >= 45 then
    print("You got a D-!")
else 
    print("You got an F!")
end