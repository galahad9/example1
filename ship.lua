require "physics"
Ship = {}

function Ship:new() 
    local Ship = display.newImage("ship.png")
    Ship.x, Ship.y = display.contentCenterX, display.contentCenterY 
    local name1 = "ship"
    Ship.myName = name1 
    --    sceneGroup:insert(Ship)
    middleAxis = display.newRect(Ship.x*1.05 ,Ship.x,20,5)
  physics.addBody(middleAxis,"static",{density=0.1,friction=0,bounce=0})
    
end
return Ship
