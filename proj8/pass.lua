io.write("Enter a password: ")
local password = io.read()

local guess = nil

while guess ~= password do
    io.write("Guess the password: ")
    guess = io.read()
    if guess ~= password then
        print("Incorrect password. Try again.")
    end
end
print("You got it! The password is correct.")