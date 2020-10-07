local keyManager = {}

function keyManager:Update(key, pMyGame)
  
    if key == "space" then

        for i = 1, #pMyGame.myShipManager.list_ships,1 do

          local s = pMyGame.myShipManager.list_ships[i]

          if s.name == "Player" then

            local x,y = s:Localisation("Player")
            pMyGame.myTirManager:CreateTir("tir"..tostring(pMyGame.nbrTirTirer), "Shot_1_002.png", x-5, y -168, "Player", "PlayerStandard")
            pMyGame.nbrTirTirer = pMyGame.nbrTirTirer + 1
          end
                 
        end

    end

    if love.keyboard.isDown("left") then

        pMyGame.myShipManager:Deplace("Player", "left")
        
      elseif love.keyboard.isDown("right") then
    
        pMyGame.myShipManager:Deplace("Player", "right")
    
      elseif love.keyboard.isDown("up") then
    
        pMyGame.myShipManager:Deplace("Player", "up")
    
      elseif love.keyboard.isDown("down") then
    
        pMyGame.myShipManager:Deplace("Player", "down")
    
      else
    
        pMyGame.myShipManager:FermeLesMoteurs("Player")
    
      end
        
end

return keyManager
