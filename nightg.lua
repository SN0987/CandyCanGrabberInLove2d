require("red_cane")
require("snow_ball_one")
require("ball")
nightg = {}

local candy_canes = {}

local function load_canes()
    d = love.filesystem.read("cc1.txt")
    return d
end

local function load_font(size)
    d = love.graphics.newFont("fonts/pixel.ttf")
    return d
end

local function draw_font(f,r,g,b,t,x,y)
    love.graphics.setFont(f)
    love.graphics.setColor(r,g,b)
    love.graphics.print(t,x,y)
end

local function col(a,b) 
    if math.abs(b.x - (a.x + a.width / 2)) < a.width / 2 and math.abs(b.y - (a.y + a.height / 2)) < a.height / 2 then
        return true
    else
        return false
    end

end
function nightg:load(night_game,Worlds,world_state)
    self.night_game = night_game
    self.Worlds = Worlds
    self.world_state = world_state
    if not love.filesystem.getInfo("cc1.txt") then
        candy_canes.canes = 0
    elseif love.filesystem.getInfo("cc1.txt") then
        candy_canes.canes = load_canes()
    end
    red_cane:load(candy_canes)
    snow_ball_one:load(candy_canes)
    ball:load(candy_canes)
end


function nightg:update(dt)
    if self.night_game.play == true then
        if love.keyboard.isDown("3") then
            self.night_game.play = false
        end
        red_cane:update(dt)
        snow_ball_one:update(dt)
        ball:update(dt)
        if col(snow_ball_one,red_cane) then
            red_cane.x = math.random(15,love.graphics.getWidth() - 15)
            red_cane.y = math.random(15,love.graphics.getHeight() - 40)
            candy_canes.canes = candy_canes.canes + 1
            love.filesystem.write("cc1.txt",candy_canes.canes)
            love.filesystem.write("world.txt",self.Worlds.world)
            
            
        end
        if col(snow_ball_one,ball.ball_one) or col(snow_ball_one,ball.ball_two) then
            if tonumber(candy_canes.canes) >= 5 then
                candy_canes.canes = tonumber(candy_canes.canes) - 1
            
            end
        end
        if tonumber(candy_canes.canes) >= 200 then
            self.world_state.world_1 = false
            self.world_state.world_2 = false
            self.world_state.world_3 = false
            self.world_state.hub = true
            self.Worlds.world = 2
            self.night_game.play = false
            love.filesystem.write("world.txt",self.Worlds.world)
            
        end
    end

end

function nightg:draw()
    if self.night_game.play == true then
       draw_font(load_font(5),0.5,0,0.8,"Canes " .. tostring(tonumber(candy_canes.canes)) .. "/" .. 200,0,0)
       red_cane:draw()
       snow_ball_one:draw()
       ball:draw()
    end
end

return night_game