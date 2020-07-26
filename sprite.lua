local spriteModel = {}

local tileSheetModel = require("tileSheet")

function spriteModel:Create(pName, pNameFile, pTileWidth, pTileHeight, pMap)
  
  local sprite = {}
  print("Dans le spriteModel")

  --print(pName)
  --print(pNameFile)
  --print(pTileWidth)
  --print(pTileHeight)
  --print(pMap)

  sprite.posX = 0
  sprite.posY = 0
  sprite.name = pName
  sprite.oX = 0
  sprite.oY = 0
  sprite.type = nil
  sprite.currentImage = 1
  sprite.frames = 1
  sprite.style = false
  sprite.listImages = {}
  sprite.listEffet = {}
  sprite.engine = false

  local imageTempo = love.graphics.newImage(pNameFile)
  table.insert(sprite.listImages, imageTempo)

  if (pMap ~=nil) then
    sprite.tileSheet = tileSheetModel:CreateTileSheet(pNameFile, pTileWidth, pTileHeight, pMap)
    sprite.frames = sprite.tileSheet.frames
    sprite.style = true
  end

  function sprite:anime()
  
    if sprite.currentImage < #sprite.frames then 
      sprite.currentImage = sprite.currentImage + 0.15
      
    else 
      sprite.currentImage = 1
    end

  end
  
  function sprite:DeplaceGauche()
    self.posX = self.posX - 6
    
  end

  function sprite:DeplaceDroite()
    self.posX = self.posX + 6
    
  end

  function sprite:DeplaceHaut()
    self.posY = self.posY - 6
    
  end

  function sprite:DeplaceBas()
    self.posY = self.posY + 6
    
  end

  function sprite:MoteurOn()
    self.engine = true
  end

  function sprite:MoteurOff()
    self.engine = false
  end

return sprite
end

return spriteModel
