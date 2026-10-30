function love.load()
    windowWidth, windowHeight = love.window.getMode()
    myCanvas = love.graphics.newCanvas(windowWidth, windowHeight)
    love.window.setTitle("Cookie Clicker: Crebs Edition")
    love.mouse.setVisible(false)

    baseRadius = 100
    buttonRadius = baseRadius
    cookieCount = 0
    cookieScale = 1.0
    chochclateChipsScale = 1.0

    chocolateChipsLocations = {}

    for i = 1, 12 do
        local angle = math.random() * 2 * math.pi
        local relativeX, relativeY, chipRadius
        local attempts = 0

        repeat
            attempts = attempts + 1

            local distanceFromCenter = math.random(20, baseRadius - 10)
            relativeX = distanceFromCenter * math.cos(angle)
            relativeY = distanceFromCenter * math.sin(angle)
            chipRadius = math.random(5, 20)

            isOverlapping = false
            for _, chip in ipairs(chocolateChipsLocations) do
                local dx = relativeX - chip.x
                local dy = relativeY - chip.y
                local distance = math.sqrt(dx * dx + dy * dy)

                if distance < (chipRadius + chip.radius) then
                    isOverlapping = true
                    break
                end
            end

        until not isOverlapping

        table.insert(chocolateChipsLocations, {
            x = relativeX,
            y = relativeY,
            radius = chipRadius
        })
    end

end

function love.draw()
    love.graphics.setCanvas(myCanvas)
    love.graphics.clear(47 / 255, 142 / 255, 237 / 255, 1)
    love.graphics.setCanvas()
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(myCanvas, 0, 0)
    backgroundBarsShade()
    backgroundBars()
    cookie()
    cursor()
    cookieCounter()
    local windowW, windowH = love.window.getMode()
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Window Width: " .. windowW, 10, 10)
    love.graphics.print("Window Height: " .. windowH, 10, 30)
    fpsCounter()
end

function backgroundBars()
    local barWidth = 30
    local barHeight = windowHeight
    local barSpacing = 30
    local numBars = math.ceil(windowWidth / (barWidth + barSpacing))

    for i = 0, numBars - 1 do
        local x = i * (barWidth + barSpacing)
        love.graphics.setColor(92/255, 156/255, 224/255, 1)
        love.graphics.rectangle("fill", x, 0, barWidth, barHeight)
    end
end

function backgroundBarsShade()
    local barWidth = 32
    local barHeight = windowHeight
    local barSpacing = 28
    local numBars = math.ceil(windowWidth / (barWidth + barSpacing))

    for i = 0, numBars - 1 do
        local x = i * (barWidth + barSpacing)
        love.graphics.setColor( 0, 0, 0, 0.2)
        love.graphics.rectangle("fill", x, 0, barWidth, barHeight)
    end
end

function love.update(dt)
    mouseX, mouseY = love.mouse.getPosition()

    if cookieScale > 1.0 then
        cookieScale = cookieScale - 2 * dt
        if cookieScale < 1.0 then
            cookieScale = 1.0
        end
    end

    if chochclateChipsScale > 1.0 then
        chochclateChipsScale = chochclateChipsScale - 2 * dt
        if chochclateChipsScale < 1.0 then
            chochclateChipsScale = 1.0
        end
    end
    
    buttonRadius = baseRadius * cookieScale
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local centerX = windowWidth / 2
        local centerY = windowHeight / 2
        
        local dx = x - centerX
        local dy = y - centerY
        local distance = math.sqrt(dx * dx + dy * dy)

        if distance <= buttonRadius then
            cookieCount = cookieCount + 1
            cookieScale = 1.15
            chochclateChipsScale = 1.15
        end
    end
end

function fpsCounter()
    local fps = love.timer.getFPS()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("FPS: " .. fps, 10, 50)
end

function cookie()
    local centerX = windowWidth / 2
    local centerY = windowHeight / 2

    cookieOutline()
    love.graphics.setColor(150 / 255, 138 / 255, 89 / 255, 1)
    love.graphics.circle("fill", centerX, centerY, buttonRadius)

    for _, chip in ipairs(chocolateChipsLocations) do
        chocolateChip(centerX + chip.x, centerY + chip.y, chip.radius * chochclateChipsScale)
    end
end

function cookieOutline()
    local centerX = windowWidth / 2
    local centerY = windowHeight / 2

    love.graphics.setColor(120 / 255, 108 / 255, 59 / 255, 1)
    love.graphics.setLineWidth(12)
    love.graphics.circle("line", centerX, centerY, buttonRadius)
end

function chochlateChipOutline(x, y, radius)
    love.graphics.setColor(120 / 255, 108 / 255, 59 / 255, 1)
    love.graphics.setLineWidth(3)
    love.graphics.circle("line", x, y, radius)
end

function chocolateChip(x, y, radius)
    chochlateChipOutline(x, y, radius)
    love.graphics.setColor(0.4, 0.2, 0, 1)
    love.graphics.circle("fill", x, y, radius)
end

function cookieCounter()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("Cookies: " .. cookieCount, 10, 70)
end

function cursorOutline()
    love.graphics.setColor(0.25, 0.25, 0.25, 1)
    love.graphics.setLineWidth(2)
    love.graphics.polygon("line", mouseX, mouseY, mouseX - 7.5, mouseY + 15, mouseX + 7.5, mouseY + 15)
end

function cursor()
    cursorOutline()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.polygon("fill", mouseX, mouseY, mouseX - 7.5, mouseY + 15, mouseX +7.5, mouseY + 15)
end