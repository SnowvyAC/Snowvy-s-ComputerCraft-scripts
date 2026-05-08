local screen = peripheral.wrap('monitor_0')
local homing = 0
local homed = 0
local relay0 = peripheral.wrap('redstone_relay_0')

while true do
    if redstone.getInput('back', true) then
        screen.clear()
        screen.setCursorPos(1, 1)
        screen.write("Manual mode enabled")
        screen.write("Touchscreen input disabled")
    else
        screen.clear()
        screen.setCursorPos(1, 1)
        if homed == 0 then 
            screen.write("Homing in progress")

            homing = 1
        else
            screen.write("Homing complete")
            screen.write("Touchscreen input enabled")
        end
    end
end