import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "lib/roomy"

import "Room_Test"
import "SongPlayer"

local pd <const> = playdate
local gfx <const> = pd.graphics

math.randomseed(playdate.getSecondsSinceEpoch())

__roomManager = Manager()
__roomManager:hook()
__roomManager:enter(Room_Test())

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
	__roomManager:emit("update")
end