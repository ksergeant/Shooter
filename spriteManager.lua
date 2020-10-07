local spriteManager = {}

spriteManager.list_sprites = {}

local spriteModel = require("sprite")

function spriteManager:CreateSprite(pName, pNameFile, pPosX, pPosY, pTypeSprite)
  
  local spriteTempo = {}

  spriteTempo = spriteModel:Create(pName, pNameFile, pPosX, pPosY, pTypeSprite)
  
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

function spriteManager:Update(dt)
  
    if #spriteManager.list_sprites~=nil then
      
      for i = 1, #spriteManager.list_sprites do
      
        local s = spriteManager.list_sprites[i]
      
        print("Dans Sprite Update")
        print(s.name)
        print("PosX:"..tostring(s.posX))
        print("PosY:"..tostring(s.posY))
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

      end
                        
    end

  end

end

return spriteManager
