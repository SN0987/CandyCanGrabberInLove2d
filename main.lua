--requires
require("snow")
require("menu")
require("see")
require("game")
--end

local GameState = {menu=true,game=false,credit=false}

function love.load()

    snow:load(GameState,512,512,20)
    menu:load(GameState)
    see:load(GameState)
    game:load(GameState)




end


function love.update(dt)

    snow:update(dt)
    menu:update(dt)
    see:update(dt)
    game:update(dt)
    


end




function love.draw()
    menu:draw()
    see:draw()
    game:draw()
    snow:draw()
    
    


end


function love.keypressed(key,scancode,isrepeat)
    if key == "escape" then
        love.filesystem.write("world.txt",game.Worlds.world)
        
        love.event.quit()
    end

end