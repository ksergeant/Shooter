local spriteModel = {}

local tileSheetModel = require("tileSheet")

function spriteModel:Create(pName, pNameFile, pPosX, pPosY, pTypeSprite)
  
  local sprite = {}
  print("Dans le spriteModel")

  sprite.posX = pPosX
  sprite.posY = pPosY
  sprite.name = pName
  sprite.oX = 0
  sprite.oY = 0
  sprite.type = pTypeSprite
  sprite.currentImage = 1
  sprite.frames = 1
  sprite.style = false
  sprite.listImages = {}
  sprite.listEffet = {}
  sprite.engine = false

  local imageTempo = love.graphics.newImage(pNameFile)
  table.insert(sprite.listImages, imageTempo)

  function sprite:anime()
  
    if sprite.currentImage < #sprite.frames then 
      sprite.currentImage = sprite.currentImage + 0.15
      
    else 
      sprite.currentImage = 1
    end

  end
  
return sprite

end

return spriteModel
