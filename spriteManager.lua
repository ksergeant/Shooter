local spriteManager = {}

spriteManager.list_sprites = {}

local spriteModel = require("sprite")

function spriteManager:CreateSprite(pName, pNameFile, pTileWidth, pTileHeight, pMap)
  
  local spriteTempo = {}
  print("Dans le Manager")

  --print(pName)
  --print (pNameFile)
  --print (pTileWidth)
  --print (pTileHeight)
  --print (pMap)

  spriteTempo = spriteModel:Create(pName, pNameFile, pTileWidth, pTileHeight, pMap)
  
  table.insert(spriteManager.list_sprites, spriteTempo)
  
  print("Sprite Create")
  
end

function spriteManager:SettingSprite(pSpriteName, pPosX, pPosY, pOrigineX, pOrigineY, pType, pCurrentImage)
  
  -- recherche dans le spriteManager et si il est présent, il est modifié
  if #spriteManager.list_sprites~=nil then

    for i = 1, #spriteManager.list_sprites do
      
      local s = spriteManager.list_sprites[i]
      
      if pSpriteName == s.name then 
          
        s.posX = pPosX
        s.posY = pPosY
        s.oX = pOrigineX
        s.oY = pOrigineY
        s.type = pType
        s.currentImage= pCurrentImage
        print ("Changement effectué")
        
      end

    end
  
  end
  
end

function spriteManager:AjoutImageSprite(pSpriteName, pNameFile, pExtention, pList)

  for i = 1, #spriteManager.list_sprites do

    local s = spriteManager.list_sprites[i]

    if pSpriteName== s.name then

        if pList == "Images" then
          local ImageTempo = love.graphics.newImage(pNameFile..pExtention)
          table.insert(s.listImages,ImageTempo)
        end

        if pList == "Effets" then
          local ImageTempo = love.graphics.newImage(pNameFile..pExtention)
          table.insert(s.listEffet,ImageTempo)
        end

    end

  end

end

function spriteManager:Deplace(pSpriteName, pSens)

  for i = 1, #spriteManager.list_sprites do
      
    local s = spriteManager.list_sprites[i]

    if pSpriteName == s.name then 
     
      if pSens == "left" then
        s:DeplaceGauche()
        s:MoteurOn()
      end

      if pSens == "right" then
        s:DeplaceDroite()
        s:MoteurOn()
      end

      if pSens == "up" then
        s:DeplaceHaut()
        s:MoteurOn()
      end

      if pSens == "down" then
        s:DeplaceBas()
        s:MoteurOn()
      end

    end
  end

end

function spriteManager:FermeLesMoteurs(pSpriteName)

  for i = 1, #spriteManager.list_sprites do
      
    local s = spriteManager.list_sprites[i]

    if pSpriteName == s.name then 
     
      s:MoteurOff()
    
    end
  end

end

function spriteManager:Localisation(pSpriteName)

  local posXtempo = {}
  local posYtempo = {}

  for i = 1, #spriteManager.list_sprites do
      
    local s = spriteManager.list_sprites[i]

    if pSpriteName == s.name then 
     
      posXtempo = s:getPositionX()
      posYtempo = s:getPositionY()
      
    end

  end

  return posXtempo, posYtempo

end

function spriteManager:Update(dt)
  
    if #spriteManager.list_sprites~=nil then
      
      for i = 1, #spriteManager.list_sprites do
      
        local s = spriteManager.list_sprites[i]
        
       -- s.anime()
       -- s.move() 
        
      end
      
    end
        
end

function spriteManager:Draw()
  
  if #spriteManager.list_sprites~=nil then

    for i = 1, #spriteManager.list_sprites do
      
      local s = spriteManager.list_sprites[i]
      --print(s.frames[1])
      
      if s.style == true then
       love.graphics.draw(
        s.tileSheet.largeImage,
        s.frames[math.floor(s.currentImage)], 
        s.posX, 
        s.posY,
        0,
        0.1,
        0.1)
      
      else
        love.graphics.draw(
        s.listImages[s.currentImage], 
        s.posX, 
        s.posY,
        0,
        0.1,
        0.1)

        if s.engine == true then
          love.graphics.draw(
            s.listEffet[s.currentImage], 
            s.posX +44.5, 
            s.posY+74,
            0,
            0.2,
            0.2)
        end

      end
                        
    end

  end

end

return spriteManager
