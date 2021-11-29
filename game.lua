
require("world_one")
game = {}

local world_state = {hub=true,world_1=false,world_2=false,world_3=false}
local function load_world()
    world_level = love.filesystem.read("world.txt")
    return world_level
end

local function make_button(a)
    if a.color == "not" then
        love.graphics.setColor(0.5,0,0)
    elseif a.color == "yes" then
        love.graphics.setColor(1,0.2,0.2)
    end
    love.graphics.rectangle("fill",a.x,a.y,a.width,a.height)
end
local function col(a)
    if math.abs(love.mouse.getX() - (a.x + a.width / 2 )) < a.width / 2 and math.abs(love.mouse.getY() - (a.y + a.height / 2)) < a.height / 2 then
        return true
    else
        return false
    end
end
local function load_font(size)
    d = love.graphics.newFont("fonts/pixel.ttf",size)
    return d

end
local function draw_font(f,r,g,b,t,x,y)
    love.graphics.setFont(f)
    love.graphics.setColor(r,g,b)
    love.graphics.print(t,x,y)

end
function game:load(GameState)
    self.Worlds = {}
    self.GameState = GameState
    if not love.filesystem.getInfo("world.txt") then
        self.Worlds.world = 1
    elseif love.filesystem.getInfo("world.txt") then
        self.Worlds.world = load_world()
    end
    --bg
    self.bg = {}
    self.bg.image = love.graphics.newImage("assets/menubg.png")
    self.bg.x = 0
    self.bg.y = 0
    -- load button
    self.btn = {}
    self.btn.x = love.graphics.getWidth() / 2 - 70
    self.btn.y = love.graphics.getHeight() / 2 - 100
    self.btn.width = 150
    self.btn.height = 50
    self.btn.color = "not"
    world_one:load(world_state,self.Worlds)


end


function game:update(dt)
    if self.GameState.game == true then
        if love.keyboard.isDown("1") then
            game.GameState.menu = true
            game.GameState.game = false
            game.GameState.credit = false
            love.filesystem.write("world.txt",game.Worlds.world)
        end
        if world_state.hub == true then
            if love.mouse.isDown(1) then
                if col(self.btn) then
                    if tonumber(self.Worlds.world) <= tonumber(1) then
                        world_state.hub = false
                        world_state.world_1 = true
                        world_state.world_2 = false
                        world_state.world_3 = false
                    end
                end
            end



        end
        world_one:update(dt)
       
       

    end


end



function game:draw()
    if self.GameState.game == true then
        if world_state.hub == true then
            love.graphics.draw(self.bg.image,self.bg.x,self.bg.y)
            make_button(self.btn)
            if col(self.btn) then
                self.btn.color = "yes"
            else
                self.btn.color = "not"
            end
            draw_font(load_font(20),0,0,0,"Load",217,157)
        end
        world_one:draw()
       
    end
end





return game