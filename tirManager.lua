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
      
      for i = 1, #tirManager.list_tirs do
      
        local t = tirManager.list_tirs[i]
             
      end
      
    end
        
end

function tirManager:Draw()
  
  if #tirManager.list_tirs~=nil then

    for i = 1, #tirManager.list_tirs do
      
        local t = tirManager.list_tirs[i]
                      
    end

  end

end

return tirManager
