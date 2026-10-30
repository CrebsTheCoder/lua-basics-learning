print("Welcome to the number guessing game!")

local secret_number = math.random(1, 100)

repeat
    print("Guess a number between 1 and 100:")
    local guess = tonumber(io.read())

    if guess < secret_number then
        print("Too low! Try again.")
    elseif guess > secret_number then
        print("Too high! Try again.")
    else
        print("Congratulations! You've guessed the secret number: " .. secret_number)
    end
until guess == secret_number