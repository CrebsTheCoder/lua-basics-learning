io.write("Yo who are you: ")
local name = io.read()
io.write("Hello " .. name .. "! How are you doing today? ")
print("Oh thats nice to hear, I dont care lowk")
io.write("How old are you tho: ")
local age = tonumber(io.read())
if age then
    if age < 18 then
        print("Oh wow you are a minor, I am not allowed to talk to you")
    else
        print("Oh wow you are an adult, I am allowed to talk to you")
    end
end