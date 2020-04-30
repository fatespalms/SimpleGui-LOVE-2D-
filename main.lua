--@@ REQUIRES
_G.libs_path = "libs/"
require (_G.libs_path.."gui.gui")

function love.load()
    gw,gh = love.graphics.getDimensions()
    --@@TEST
    newButton = gui.newButton({    
                x = gw/3.5,
                y = gh/2.6,
                w = 400,
                h = 100,
                pressed =   function(button)
                                if button == 1 then
                                    newButton.x = newButton.x + 5
                                elseif button == 2 then
                                    newButton.x = newButton.x - 5
                                end
                            end,
                -- released =  function(button)
                                --love.event.quit()
                --           end,
                })
    newPointer = gui.newPointer({image = love.graphics.newImage("btn.png")})
end

function love.update(dt)
    gui.update(dt)
end

function love.draw()
    gui.draw()
end

function love.mousepressed(x,y,button,istouch)
    gui.mousepressed(x, y, button)
end

function love.mousereleased(x,y,button,istouch)
    gui.mousereleased(x, y, button)
end