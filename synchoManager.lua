local synchoManager = {}

function synchoManager:Update(pMyGame)
  
    local listePasAJour = {}
    local i2 = 1

    -- Cherche les valeurs du shipManager pour les mettre à jour
    if #pMyGame.myShipManager.list_ships~=nil then
      
        for i = #pMyGame.myShipManager.list_ships, 1, -1 do
  
          local s = pMyGame.myShipManager.list_ships[i]

          listePasAJour[i2] = s
          i2 = i2 +1
        end           
    end

    -- Pour les valeurs trouvées mise à jour dans le spriteManager
    for i = #listePasAJour, 1, -1 do
        
        local m = listePasAJour[i]
       
        for j = 1, #pMyGame.mySpriteManager.list_sprites, 1 do
            if m.name == pMyGame.mySpriteManager.list_sprites[j].name then

                pMyGame.mySpriteManager.list_sprites[j].posX = m.posX
                pMyGame.mySpriteManager.list_sprites[j].posY = m.posY

            end
        end
    end
    
    
end

return synchoManager
