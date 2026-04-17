-- Variables
local relay = peripheral.find("redstone_relay") 
local startTime = os.clock()
TXW = false
TYW = false
TZW = false
-- T[]W means Touches [] Wall
local INST = Menu

-- Movement local
local MZT = function ()
    redstone.setOutput('top', false)
    redstone.setOutput('right', false)
end
local MXT = function ()
    redstone.setOutput('top', true)
    redstone.setOutput('right', false)
end
local MYT = function ()
    redstone.setOutput('top', true)
    redstone.setOutput('right', true)
end
-- M[]T means Movement [] true

local ACW = function ()
    redstone.setOutput('bottom', false)
end
-- ACW = Anti Clock Wise
local CW = function ()
    redstone.setOutput('bottom', false)
end
-- CW = ClockWise

-- Self calibration Logic
if (redstone.setOutput('top') == false) then
    MZT
    until
        redstone.setOutput('top') == true
end


-- Instructions local
local calibrate = function()

end
-- interaction
print('Instruction')
read.io()
