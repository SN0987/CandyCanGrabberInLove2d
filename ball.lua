-- its a snowball not an actuall ball

ball = {}

local function make_balls(balls)
    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill",balls.x,balls.y,balls.r)
end

local function do_balls(balls,dt)
    
    local speedx = 0
    local speedy = 0
    if balls.dir == "set" then
        speedx = 550
        speedy = 350
        balls.x = balls.x + speedx * dt
        balls.y = balls.y + speedy * dt
    elseif balls.dir == "down" then
        speedy = 500
        balls.y = balls.y + speedy * dt
    
    elseif balls.dir == "up" then
        speedy = -500
        balls.y = balls.y + speedy * dt
    elseif balls.dir == "side_" then
        speedx = 250
        balls.x = balls.x + speedx * dt
    elseif balls.dir == "side__" then
        speedx = -250
        balls.x = balls.x + speedx * dt
    end

    if balls.x >= love.graphics.getWidth() - balls.r then
        balls.dir = "side__"

    end

    if balls.y >= love.graphics.getHeight() - balls.r then
        balls.dir = "up"
    end

    if balls.y <= 0 then
        balls.dir = "down"
    end

    if balls.x <= 0 then
        balls.dir = "side_"
    end


    


end
function ball:load(candy_canes)
    self.candy_canes = candy_canes
    self.ball_one = {}
    self.ball_one.x = 32
    self.ball_one.y = 32
    self.ball_one.r = 15
    self.ball_one.dir = "set"
    
    
    self.ball_two = {}
    self.ball_two.x = 256 - 32 / 2
    self.ball_two.y = 256
    self.ball_two.r = 15
    self.ball_two.dir = "up"
   
    

end


function ball:update(dt)

    do_balls(self.ball_one,dt)
    do_balls(self.ball_two,dt)
end


function ball:draw()

    make_balls(self.ball_one)
    make_balls(self.ball_two)
end


return ball