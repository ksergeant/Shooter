local shipManager = {}

shipManager.list_ships = {}

local shipModel = require("ship")

function shipManager:CreateShip(pName, pPosX, pPosY, pTypeShip, pListImages, pListEffets)
  
  local shipTempo = {}

  shipTempo = shipModel:Create(pName, pPosX, pPosY, pTypeShip, pListImages, pListEffets)
  
  table.insert(shipManager.list_ships, shipTempo)
  
end

function shipManager:Deplace(pShipName, pSens)

    for i = 1, #shipManager.list_ships do
        
      local s = shipManager.list_ships[i]
  
      if pShipName == s.name then 
       
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

function shipManager:FermeLesMoteurs(pShipName)

    if #shipManager.list_ships~=nil then
      
        for i = #shipManager.list_ships, 1, -1 do
  
          local s = shipManager.list_ships[i]

          if s.name == pShipName then 
             s:MoteurOff()
          end

        end
    end

end

function shipManager:Update(dt)
  
    if #shipManager.list_ships~=nil then
      
      for i = #shipManager.list_ships, 1, -1 do

        local s = shipManager.list_ships[i]
          
      end
      
    end
        
end

function shipManager:Draw()
  
  if #shipManager.list_ships~=nil then

    for i = 1, #shipManager.list_ships do

        local s = shipManager.list_ships[i]

        love.graphics.draw(
          s.listImages[1], 
          s.posX, 
          s.posY,
          0,
          0.1,
          0.1) 
          
          if s.engine == true then
            love.graphics.draw(
               s.listEffets[1], 
               s.posX +44.5, 
               s.posY+74,
               0,
               0.2,
               0.2)
          end
          
    end

  end

end

return shipManager
