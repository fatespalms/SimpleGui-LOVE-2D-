--[[@@
    to use this component simply do the ff.
        var = gui.newPointer({image = image})
    when using quads just add quad = quad
        var = gui.newPointer({image = image , quad = quad})
@@]]

function gui.newPointer(params)
    params = params or {}
    local pointer = {}
    --@@ POINTER TYPE
    pointer.type = "pointer"
    --@@ POINTER COORDS 
    pointer.x = 0
    pointer.y = 0 
    pointer.w = 2
    pointer.h = 2
    --@@ POINTER IMAGE
    pointer.image = params.image or error("pointer image can't be nil")
    pointer.quad  = params.quad or nil
    love.mouse.setVisible( false )
    
    return gui.insertComponent(pointer)
end

function gui.newPointerDraw(component)
    
    if component.type == "pointer" then
       
        if component.quad == nil then
            love.graphics.draw(component.image,love.mouse.getPosition())
        else
            love.graphics.draw(component.image,component.quad,love.mouse.getPosition())
        end
    end
end