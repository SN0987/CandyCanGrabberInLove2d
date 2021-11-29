snow_ball_one = {}


local function movement(a,dt)
    local speedx = 800
    local speedy = 600
    if love.keyboard.isDown("a") then
        a.x = a.x - speedx * dt
    
    end

    if love.keyboard.isDown("d") then
        a.x = a.x + speedx * dt
    end

    if love.keyboard.isDown("w") then
        a.y = a.y - speedy * dt
    end

    if love.keyboard.isDown("s") then
        a.y = a.y + speedy * dt
    end

    if a.x <= 0 then
        a.x = 0
    end

    if a.x >= love.graphics.getWidth() - a.width then
        a.x = love.graphics.getWidth() - a.width
    end

    if a.y <= 0 then
        a.y = 0
    end

    if a.y >= love.graphics.getHeight() - a.height then
        a.y = love.graphics.getHeight() - a.height
    end
end
function snow_ball_one:load(candy_canes)
    self.candy_canes = {}
    self.image = love.graphics.newImage("assets/snowball_one.png")
    self.x = 256
    self.y = 256
    self.width = 64
    self.height = 64

    
end


function snow_ball_one:update(dt)
    movement(self,dt)
end


function snow_ball_one:draw()
    love.graphics.setColor(1,1,1)
    love.graphics.draw(self.image,self.x,self.y)

end





return snow_ball_one