--test
local frTurbineS = peripheral.wrap('Create_RotationSpeedController_3')
local flTurbineS = peripheral.wrap('Create_RotationSpeedController_4')
local brTurbineS = peripheral.wrap('Create_RotationSpeedController_2')
local blTurbineS = peripheral.wrap('Create_RotationSpeedController_1')
local horTurb = peripheral.wrap('Create_RotationSpeedController_5')
local mainMonitor = peripheral.wrap('monitor_1')
local turnLeft = 0
local turnRight = 0
local height = 0
local actHeight = 0
local horSpeedDes = 0
local hoverHeight = 0
local horSpeed = 0
local desTurnLeft = peripheral.wrap('redstone_relay_24')
local desTurnRight = peripheral.wrap('redstone_relay_25')
local desHeight = peripheral.wrap('redstone_relay_26')
local rawHeight = peripheral.wrap('altitude_sensor_0')
local horSpeedSel = peripheral.wrap('redstone_relay_27')
local steerLeft = peripheral.wrap('redstone_relay_19')
local steerRight = peripheral.wrap('redstone_relay_20')
local wheelLeft = peripheral.wrap('redstone_relay_24')
local wheelRight = peripheral.wrap('redstone_relay_25')

while true do

    turnLeft = desTurnLeft.getAnalogInput('front')
    turnRight = desTurnRight.getAnalogInput('front')
    height = desHeight.getAnalogInput('top')
    actHeight = rawHeight.getHeight()
    horSpeedDes = horSpeedSel.getAnalogInput('top')

    mainMonitor.clear()
    mainMonitor.setCursorPos(1, 1)
    mainMonitor.write("Status:")
    mainMonitor.setCursorPos(1, 2)
    mainMonitor.write("Hovering at:" .. string.format("%.2f", actHeight))
    mainMonitor.setCursorPos(1, 3)
    mainMonitor.write("Desired level:" .. tostring(height))

    hoverHeight = height * 16
    if height == 15 then hoverHeight = 256 end

    horSpeed = horSpeedDes * 16
    if horSpeedDes == 15 then horSpeed = 256 end

    horTurb.setTargetSpeed(horSpeed)

    frTurbineS.setTargetSpeed(hoverHeight)
    flTurbineS.setTargetSpeed(hoverHeight)
    brTurbineS.setTargetSpeed(hoverHeight)
    blTurbineS.setTargetSpeed(hoverHeight)

    if wheelRight.getInput('front') == true then
        steerRight.setOutput('front', true)
    else
        steerRight.setOutput('front', false)
    end
    
    if wheelLeft.getInput('front') == true then
        steerLeft.setOutput('front', true)
    else
        steerLeft.setOutput('front', false)
    end

    sleep(0.001)
end