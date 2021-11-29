--snow fall system also particle system for rainfall snow fall and anything else
snow = {}
local snow_table = {}

function snow:load(GameState,width,height,particleSize)
    self.GameState = GameState
    self.width = width
    self.height = height
    self.particleSize = particleSize

    for i=1,particleSize do
        table.insert(snow_table,{x=math.random(0,self.width),y=math.random(0,self.height),r=math.random(1,2)})

    end





end



function snow:update(dt)

    for i,p in pairs(snow_table) do
        local y_vel = math.random(100,350)
        local angle = 0

  


        p.y = p.y + y_vel * dt
        p.x = p.x + angle * dt

        if p.x >= self.width - p.r then
            p.y = math.random(0,self.height)
            p.x = math.random(0,self.width)
        end
        if p.y >= self.height - p.r then
            p.y = math.random(0,self.height)
            p.x = math.random(0,self.width)
        end

    end

    


end





function snow:draw()

    for i,p in pairs(snow_table) do
        love.graphics.setColor(1,1,1)
        love.graphics.circle("fill",p.x,p.y,p.r)
    end


end


return snow