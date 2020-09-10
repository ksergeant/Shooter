local tirManager = {}

tirManager.list_tirs = {}

local tirModel = require("tir")

function tirManager:CreateTir(pName, pNameFile, pTileWidth, pTileHeight, pWho, pType, pMap)
  
  local tirTempo = {}
  print("Dans le TirManager")

  tirTempo = tirModel:Create(pName, pNameFile, pTileWidth, pTileHeight, pWho, pType, pMap)
  
  table.insert(tirManager.list_tirs, tirTempo)
  
  print("Tir Create")
  
end

function tirManager:Update(dt)
  
    if #tirManager.list_tirs~=nil then
      
      for i = #tirManager.list_tirs, 1, -1 do
      --  print("Tir trouvé dans Update")
        local t = tirManager.list_tirs[i]
          -- print(t.name)
           t.posY = t.posY - 10

           if t.posY < -150 then
              t.delete = true
           end

           if t.delete == true then
              table.remove(tirManager.list_tirs, i )
           end
      end
      
      print(#tirManager)
    end
        
end

function tirManager:Draw()
  
  if #tirManager.list_tirs~=nil then

    for i = 1, #tirManager.list_tirs do
      
    --  print("Tir trouvé dans Draw")
        local t = tirManager.list_tirs[i]
       -- print(t.name)
        love.graphics.draw(
          t.listImages[t.currentImage], 
          t.posX, 
          t.posY,
          0,
          0.5,
          0.5)             
    end

  end

end

return tirManager
