
SimplyLibrary.gui = {} --inits
SimplyLibrary.gui.components = {} -- stores components

--@@ UPDATE PARAMS
function SimplyLibrary.gui.update(dt)

end

--@@ DRAW COMPONENTS
function SimplyLibrary.gui.draw()
    for i, component in ipairs(SimplyLibrary.gui.components) do
        --@@ DRAW BUTTONS
        SimplyLibrary.gui.newButtonDraw(component)
        --@@ DRAW POINTERS
        SimplyLibrary.gui.newPointerDraw(component)
    end
end

--@@ INSERTS COMPONENT TO BE USABLE
function SimplyLibrary.gui.insertComponent(arr)
    table.insert(SimplyLibrary.gui.components,arr)
    return arr 
end

--@@ COMPONENT TABLE RESET
function SimplyLibrary.gui.clear()
    gui.components = {}
    return true
end

--@@ COMPONENT MOUSEPRESSED
function SimplyLibrary.gui.mousepressed(x,y,button)
    for i, b in ipairs(SimplyLibrary.gui.components) do
        if b.type == "button" then
            if  b.x < x + 1 and
                x < b.x + b.w and
                b.y < y + 1 and 
                y < b.y + b.h then              
                
                b:pressed(button)

            end
        end
    end
end

--@@ COMPONENT MOUSERELEASED
function SimplyLibrary.gui.mousereleased(x,y,button)
    for i, b in ipairs(SimplyLibrary.gui.components) do
        if b.type == "button" then
            if  b.x < x + 1 and
                x < b.x + b.w and
                b.y < y + 1 and 
                y < b.y + b.h then              
               
                b:released(button)

            end
        end
    end
end