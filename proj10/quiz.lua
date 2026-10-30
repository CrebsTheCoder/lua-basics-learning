print("Hello quiz")

local questions = {
    {question = "What is the capital of France?", answer = "Paris"},
    {question = "What does the cow say", answer = "Moo"},
    {question = "What is the capital of Italy?", answer = "Rome"},
    {question = "What is the capital of Germany?", answer = "Berlin"},
    {question = "What is the capital of Spain?", answer = "Madrid"}
}

for i, q in ipairs(questions) do
    print(q.question)
    local user_answer = io.read()

    while user_answer:lower() ~= q.answer:lower() do
        print("Incorrect! Please try again.")
        user_answer = io.read()
    end
    print("Correct!")
end

print("Congratulations! You've completed the quiz.")