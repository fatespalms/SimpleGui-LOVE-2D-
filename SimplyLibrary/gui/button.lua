--[[@@
    GUI ADD NEW BUTTON 
    var = SimplyLibrary.gui.newButton({x = x , y = y, w = w, h = h, image = image or nil, quad = quad or nil , func = function()  end})
    
    to use different buttons do in func()
    func = function(buttons) --@@ to access button keypressed

    x ,y ,w ,h ,image ,quad ,func
@@]]

function SimplyLibrary.gui.newButton(params) 
    --@@ INIT
    local b = {}
    --@@ TYPE
    b.type = "button"
    --@@ COORDS + W&H
    b.x = params.x
    b.y = params.y 
    b.w = params.w
    b.h = params.h
    --@@ CHECK IF QUAD AND IMAGE IS AVAILABLE
    b.quad = params.quad or nil
    b.image = params.image or nil     
    --@@ FUNCTION TO DO
    params.pressed = params.pressed or function() end
    params.released = params.released or function() end
    --@@ HOLDS PRESSED FUNCTIONS
    function b:pressed(button)
        params.pressed(button)
    end
    --@@ HOLDS RELEASED FUNCTIONS
    function b:released(button)
       params.released(button)       
    end

    --@@ STORES THE VALUES INTO THE VAR
    return SimplyLibrary.gui.insertComponent(b)
end

function SimplyLibrary.gui.newButtonDraw(component)
    if component.type == "button" then
        if component.quad ~= nil and component.image ~= nil then
            love.graphics.draw(component.image,component.quad,component.x,component.y)
        elseif component.quad == nil and component.image ~= nil then
            love.graphics.draw(component.image,component.x,component.y)
        else
            love.graphics.rectangle("line",component.x,component.y,component.w,component.h)
        end
    end
end
