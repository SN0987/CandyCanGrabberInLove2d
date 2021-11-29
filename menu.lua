

menu = {}

local function load_font(size)
    d = love.graphics.newFont("fonts/pixel.ttf",size)

    return d

end

local function draw_font(f,r,g,b,t,x,y)
    love.graphics.setColor(r,g,b)
    love.graphics.setFont(f)
    love.graphics.print(t,x,y)

end

local function make_button(a)
    if a.color == "not" then
        love.graphics.setColor(0,0.5,0)
    elseif a.color == "yes" then
        love.graphics.setColor(0.1,1,0.4)
    end

    love.graphics.rectangle("fill",a.x,a.y,a.width,a.height)
end


local function col(a)
    if math.abs(love.mouse.getX() - (a.x + a.width / 2)) < a.width / 2 and math.abs(love.mouse.getY() - (a.y + a.height / 2)) < a.height / 2 then
        return true
    else
        return false
    end
end
function menu:load(GameState)
    self.GameState = GameState
    self.bg = {}
    self.bg.image = love.graphics.newImage("assets/menubg.png")
    self.bg.x = 0
    self.bg.y = 0
    --btn play
    self.play_btn = {}
    self.play_btn.x = love.graphics.getWidth() / 2 - 70
    self.play_btn.y = love.graphics.getHeight() / 2
    self.play_btn.width = 150
    self.play_btn.height = 50
    self.play_btn.color = "not"
    
    --end
    --how to play btn
    self.h_btn = {}
    self.h_btn.x = love.graphics.getWidth() / 2 - 70
    self.h_btn.y = love.graphics.getHeight() / 2 + 100
    self.h_btn.width = 150
    self.h_btn.height = 50
    self.h_btn.color = "not"


    --end
end



function menu:update(dt)

    if self.GameState.menu == true then
        if love.mouse.isDown(1) then
            if col(self.play_btn) then
                self.GameState.menu = false
                self.GameState.game = true
                self.GameState.credit = false
            end
            if col(self.h_btn) then
                self.GameState.menu = false
                self.GameState.game = false
                self.GameState.credit = true
            end
        end
    end
end



function menu:draw()
    if self.GameState.menu == true then
        love.graphics.setColor(1,1,1)
        love.graphics.draw(self.bg.image,self.bg.x,self.bg.y)
        draw_font(load_font(25),0,0,0,"CandyCane Grabber",35,0)
        make_button(self.play_btn)
        if col(self.play_btn) then
            self.play_btn.color = "yes"
        else
            self.play_btn.color = "not"
        end
        draw_font(load_font(20),0,0,0,"Play",225,257)
        make_button(self.h_btn)
        if col(self.h_btn) then
            self.h_btn.color = "yes"
        else
            self.h_btn.color = "not"
        end
        draw_font(load_font(20),0,0,0,"See",225,357)
    end
end





return menu