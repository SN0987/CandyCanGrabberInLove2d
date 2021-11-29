require("nightg")
world_one = {}

local night_game = {play=false}


--text functions

local function load_font(size)
    d = love.graphics.newFont("fonts/pixel.ttf",size)
    return d
end

local function draw_font(f,r,g,b,t,x,y)
    love.graphics.setFont(f)
    love.graphics.setColor(r,g,b)
    love.graphics.print(t,x,y)
end
--end

local function make_button(btn)
    if btn.color == "not" then
        love.graphics.setColor(0.5,0,0)
    elseif btn.color == "yes" then
        love.graphics.setColor(1,0.2,0.2)
    end
    love.graphics.rectangle("fill",btn.x,btn.y,btn.width,btn.height)
end

local function col(btn)
    if math.abs( love.mouse.getX() - (btn.x + btn.width / 2)) < btn.width / 2 and  math.abs(love.mouse.getY() - (btn.y + btn.height / 2)) < btn.height / 2 then
        return true
    else
        return false
    end
end


function world_one:load(world_state,Worlds)
    self.world_state = world_state
    self.Worlds = Worlds
    self.btn = {}
    self.btn.x = love.graphics.getWidth() / 2 - 70
    self.btn.y = love.graphics.getHeight() / 2 
    self.btn.width = 150
    self.btn.height = 50
    self.btn.color = "not"

    --back button    love.    love.graphics.setBackgroundColor(0.1,0,0.2)
    
    self.back_btn = {}
    self.back_btn.x = love.graphics.getWidth() / 2 - 70
    self.back_btn.y = love.graphics.getHeight() / 2 + 100
    self.back_btn.width = 150
    self.back_btn.height = 50
    self.back_btn.color = "not"
    --end
    nightg:load(night_game,self.Worlds,self.world_state)
    
end




function world_one:update(dt)
    if self.world_state.world_1 == true then
        if night_game.play == false then
            if love.keyboard.isDown("2") then
                self.world_state.world_1 = false
                self.world_state.world_2 = false
                self.world_state.world_3 = false
                self.world_state.hub = true

            end
            if love.mouse.isDown(1) then
                if col(self.back_btn) then
                    self.world_state.world_1 = false
                    self.world_state.world_2 = false
                    self.world_state.world_3 = false
                    self.world_state.hub = true
                
                end
                if col(self.btn) then
                    night_game.play = true
                end
            end
        end
        nightg:update(dt)

    end



end


function world_one:draw()
    if self.world_state.world_1 == true then
        if night_game.play == false then
            love.graphics.setBackgroundColor(0.1,0,0.2)
            draw_font(load_font(10),0.3,1,0.2,"World " .. tostring(self.Worlds.world) .. "/3",420,480)
            draw_font(load_font(30),0.3,1,0.2,"NightFall World",65,0)
            make_button(self.btn)
            if col(self.btn) then
                self.btn.color = "yes"
            else
                self.btn.color = "not"
            end
            make_button(self.back_btn)
            
            if col(self.back_btn) then
                self.back_btn.color = "yes"
            else
                self.back_btn.color = "not"
            end
            
            draw_font(load_font(20),0,0,0,"Play",226,257)
            draw_font(load_font(20),0,0,0,"Back",221,357)
        end
        nightg:draw()
    end

end


return world_one