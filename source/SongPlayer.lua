local pd <const> = playdate

local STATES = {
    PLAYING = "playing",
    STOP = "stop"
}

class("SongPlayer").extends()

function SongPlayer:init(pathSample, arrTimeRange)
    SongPlayer.super.init(self)

    self.arrTimeRange = arrTimeRange
    self.idxSound = 1

    self.pathSample = pathSample
    self.state = STATES.PLAYING
    self.sampleplayer = pd.sound.sampleplayer.new(self.pathSample)
    self:playSound()
end

function SongPlayer:playSound()
    if self.state == STATES.STOP then return end

    -- self.sampleplayer = pd.sound.sampleplayer.new(self.pathSample)
	if self.idxSound == #self.arrTimeRange then return end -- Nothing to play anymore

	self.sampleplayer:setPlayRange(self.arrTimeRange[self.idxSound], self.arrTimeRange[self.idxSound+1])
	self.sampleplayer:setFinishCallback(function ()
		self.idxSound += 1
        self:playSound()
	end)
	self.sampleplayer:play(1, math.random(7, 13) / 10)
end

function SongPlayer:stop()
    self.state = STATES.STOP
    self.sampleplayer:stop()
end