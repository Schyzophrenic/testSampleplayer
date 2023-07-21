local pd <const> = playdate
local gfx <const> = pd.graphics

local arrTimeRange <const> = {1, 20552, 38934, 60933, 82268}

class("Room_Test").extends(Room)

function Room_Test:enter()
    Room_Test.super.enter(self)

    self.songPlayer = SongPlayer("sound/french", arrTimeRange)

    local img = gfx.image.new(40, 40)
    gfx.pushContext(img)
        gfx.fillRect(0, 0, 40, 40)
    gfx.popContext()
    self.spr = gfx.sprite.new(img)
    self.spr:moveTo(200, 120)
    self.spr:add()
end

function Room_Test:update()
    self.spr:moveTo(math.random(400), math.random(240))
end