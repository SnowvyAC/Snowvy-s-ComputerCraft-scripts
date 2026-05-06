i = 0
while redstone.getInput('top', true) do
    repeat
        redstone.setOutput('left', true)
        sleep(60)
        redstone.setOutput('back', true)
        sleep(60)
        redstone.setOutput('left', false)
        redstone.setOutput('back', false)
        sleep(120)
        i = i + 1
    until i = 8
    redstone.setOutput('right', true)
    sleep(60)
    redstone.setOutput('back', true)
    sleep(60)
    redstone.setOutput('right', false)
    redstone.setOutput('back', false)
end
