
gui = {} --inits
gui.components = {} -- stores components

--@@ COMPONENTS
require (_G.libs_path.."gui.button")
require (_G.libs_path.."gui.pointer")

--@@ UPDATE PARAMS
function gui.update(dt)

end

--@@ DRAW COMPONENTS
function gui.draw()
    for i, component in ipairs(gui.components) do
        --@@ DRAW BUTTONS
        gui.newButtonDraw(component)
        --@@ DRAW POINTERS
        gui.newPointerDraw(component)
    end
end

--@@ INSERTS COMPONENT TO BE USABLE
function gui.insertComponent(arr)
    table.insert(gui.components,arr)
    return arr 
end

--@@ COMPONENT TABLE RESET
function gui.clear()
    gui.components = {}
    return true
end

--@@ COMPONENT MOUSEPRESSED
function gui.mousepressed(x,y,button)
    for i, b in ipairs(gui.components) do
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
function gui.mousereleased(x,y,button)
    for i, b in ipairs(gui.components) do
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