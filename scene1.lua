---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------
local ship = require("ship")
local composer = require( "composer" )
local scene = composer.newScene()

physics = require( "physics" )
physics.start()
physics.setGravity(0,0)
physics.setDrawMode( "hybrid" )
physics.setVelocityIterations( 10 ) 

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text2, text3, memTimer

-- Touch event listener for background image
local function onSceneTouch( self, event )
    if event.phase == "began" then
        
        composer.gotoScene( "scene2", "slideLeft", 800  )
        
        return true
    end
end


-- Called when the scene's view does not exist:
function scene:create( event )
    local sceneGroup = self.view
    
    image = display.newImage( "bg.jpg" )
    image.x = display.contentCenterX
    image.y = display.contentCenterY
    
    sceneGroup:insert( image )
    
    image.touch = onSceneTouch
    
    ShipBody = Ship:new()
    --     sceneGroup:insert( ShipBody )
    print( "\n1: create event")
end

function scene:show( event )
    
    local phase = event.phase
    
    if "did" == phase then
	
        print( "1: show event, phase did" )
	
        -- remove previous scene's view
        composer.removeScene( "scene4" )
        
        image:addEventListener( "touch", image )
        
        
    end
    
end

function scene:hide( event )
    
    local phase = event.phase
    
    if "will" == phase then
	
        print( "1: hide event, phase will" )
	
        -- remove touch listener for image
        image:removeEventListener( "touch", image )
        
    end
    
end

function scene:destroy( event )
    print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene