red_cane = {}


function red_cane:load(candy_canes)
    self.candy_canes = candy_canes
    self.image = love.graphics.newImage("assets/red_can.png")
    self.x = math.random(15,love.graphics.getWidth() - 15)
    self.y = math.random(15,love.graphics.getHeight() - 40)
    self.width = 15
    self.height = 40
end


function red_cane:update(dt)

    
    
end

function red_cane:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.image,self.x,self.y)
end


return red_cane