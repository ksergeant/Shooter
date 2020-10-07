local enemyModel = {}

function enemyModel:Create(pName, pPosX, pPosY, pTypeEnemy, pListImages, pListEffets)

    local enemy = {}
    enemy.name = pName
    enemy.engine = {}
    enemy.etat = {}
    enemy.type = pTypeEnemy
    enemy.posX = pPosX
    enemy.posY = pPosY
    enemy.currentImage = 1
    enemy.listImages = {}
    enemy.listEffets = {}
    enemy.destination = "aucune"
    
    if pListImages ~=nil then
        for i = 1, #pListImages, 1 do
            local imageTempo = love.graphics.newImage(pListImages[i])
            table.insert(enemy.listImages, i, imageTempo) 
        end 
    end

    if pListEffets ~=nil then
        for i = 1, #pListEffets, 1 do
            local imageTempo = love.graphics.newImage(pListEffets[i])
            table.insert(enemy.listEffets, i, imageTempo) 
        end
    end
    
    --spriteManager:CreateSprite(pName, pNameFile, pPosX, pPosY, pTypeSprite)

    function enemy:Tirer()
    
    end

    function enemy:getPositionX()
        return enemy.posX
    end
    
    function enemy:getPositionY()
        return enemy.posY
    end

    function enemy:DeplaceGauche()

        if enemy.posX > 6 then
            enemy.destination = "gauche"
            enemy.posX = enemy.posX - 6
    
        else
            enemy.destination = "aucune"
            enemy.posX = 20
            
        end
        
    end
    
      function enemy:DeplaceDroite()
    
        if enemy.posX < love.graphics.getWidth() - 110 then
            enemy.destination = "droite"
            enemy.posX = enemy.posX + 6
              
        else
            enemy.destination = "aucune"
            enemy.posX = love.graphics.getWidth() - 90
        end
        
      end
    
      function enemy:DeplaceHaut()
    
        if enemy.posY > 6 then 
            enemy.posY = enemy.posY - 6
        else
            enemy.posY = 6
        end
    
      end
    
      function enemy:DeplaceBas()
    
        if enemy.posY < love.graphics.getHeight() - 110 then
            enemy.posY = enemy.posY + 6
        else
            enemy.posY = love.graphics.getHeight() - 110
        end
    
      end
    
      function enemy:MoteurOn()
        enemy.engine = true
      end
    
      function enemy:MoteurOff()
        enemy.engine = false
      end
   
      function enemy:Localisation()
            return enemy.posX, enemy.posY 
       end
      
    return enemy

end

return enemyModel