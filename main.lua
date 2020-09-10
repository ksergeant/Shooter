io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art

love.graphics.setDefaultFilter("nearest")

local myGame = require("game")

function love.load()
  
  myGame:Load()

end

function love.update(dt)
  
  myGame:Update(dt)

end

function love.draw()
    
  myGame:Draw()

end

function love.keypressed(key)
  
  if key == "space" then

    local x,y = myGame.mySpriteManager:Localisation("Player")

    print("X:"..tostring(x))
    print("Y:"..tostring(y))

    myGame.myTirManager:CreateTir("tir"..tostring(myGame.nbrTirTirer), "Shot_1_002.png", x-5, y -168, "Player", "PlayerStandard")
    myGame.nbrTirTirer = myGame.nbrTirTirer + 1

  end
  
end
