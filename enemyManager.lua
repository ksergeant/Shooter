local enemyManager = {}

enemyManager.list_enemys = {}

local enemyModel = require("enemy")

function enemyManager:CreateEnemy(pName, pPosX, pPosY, pTypeShip, pListImages, pListEffets)
  
  local enemyTempo = {}

  enemyTempo = enemyModel:Create(pName, pPosX, pPosY, pTypeShip, pListImages, pListEffets)
  
  table.insert(enemyManager.list_enemys, enemyTempo)
  
end

function enemyManager:Deplace(pShipName, pSens)

    for i = 1, #enemyManager.list_enemys do
        
      local s = enemyManager.list_enemys[i]
  
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

function enemyManager:FermeLesMoteurs(pShipName)

    if #enemyManager.list_enemys~=nil then
      
        for i = #enemyManager.list_enemys, 1, -1 do
  
          local s = enemyManager.list_enemys[i]

          if s.name == pShipName then 
             s:MoteurOff()
          end

        end
    end

end

function enemyManager:Update(dt)
  
    if #enemyManager.list_enemys~=nil then
      
      for i = #enemyManager.list_enemys, 1, -1 do

        local s = enemyManager.list_enemys[i]
          
        if (s.destination == "aucune") then
           local choice = math.random(0,3)

           if (choice == 1) then
            s.destination = "gauche"

           else 
            s.destination = "droite"
           end
       
        elseif (s.destination == "gauche") then
            s:DeplaceGauche()
            s:MoteurOn()
        else 

            s:DeplaceDroite()
            s:MoteurOn()
        end
      end
      
    end
        
end

function enemyManager:Draw()
  
  if #enemyManager.list_enemys~=nil then

    for i = 1, #enemyManager.list_enemys do

        local s = enemyManager.list_enemys[i]

        love.graphics.draw(
          s.listImages[1], 
          s.posX, 
          s.posY,
          3.14159,
          0.1,
          0.1) 
          
          if s.engine == true then
            love.graphics.draw(
               s.listEffets[1], 
               s.posX -32, 
               s.posY -72 ,
               3.14159,
               0.2,
               0.2)
          end
          
    end

  end

end

return enemyManager
