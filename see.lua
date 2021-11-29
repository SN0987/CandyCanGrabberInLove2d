see = {}





function see:load(GameState)
    self.GameState = GameState
    self.bg = {}
    self.bg.image = love.graphics.newImage("assets/hbg.png")
    self.bg.x = 0
    self.bg.y = 0

end



function see:update(dt)
    if self.GameState.credit == true then
        if love.keyboard.isDown("0") then
            see.GameState.menu = true
            see.GameState.game = false
            see.GameState.credit = false
            love.filesystem.write("world.txt",game.Worlds.world)
        end

    end
end


function see:draw()
    if self.GameState.credit == true then
        love.graphics.draw(self.bg.image,self.bg.x,self.bg.y)
    end


end





return see