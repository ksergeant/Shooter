local shipModel = {}

local spriteManager = require("spriteManager")

function shipModel:Create(pName, pPosX, pPosY, pTypeShip, pListImages, pListEffets)

    local ship = {}
    ship.name = pName
    ship.engine = {}
    ship.etat = {}
    ship.type = pTypeShip
    ship.posX = pPosX
    ship.posY = pPosY
    ship.currentImage = 1
    ship.listImages = {}
    ship.listEffets = {}
    
    if pListImages ~=nil then
        for i = 1, #pListImages, 1 do
            local imageTempo = love.graphics.newImage(pListImages[i])
            table.insert(ship.listImages, i, imageTempo) 
        end 
    end

    if pListEffets ~=nil then
        for i = 1, #pListEffets, 1 do
            local imageTempo = love.graphics.newImage(pListEffets[i])
            table.insert(ship.listEffets, i, imageTempo) 
        end
    end
    
    --spriteManager:CreateSprite(pName, pNameFile, pPosX, pPosY, pTypeSprite)

    function ship:Tirer()
    
    end

    function ship:getPositionX()
        return ship.posX
    end
    
    function ship:getPositionY()
        return ship.posY
    end

    function ship:DeplaceGauche()

        if ship.posX > 6 then
            ship.posX = ship.posX - 6
    
            print(ship.posX)

        else
            ship.posX = 6
        end
        
    end
    
      function ship:DeplaceDroite()
    
        if ship.posX < love.graphics.getWidth() - 110 then
            ship.posX = ship.posX + 6
    
        else
            ship.posX = love.graphics.getWidth() - 110
        end
        
      end
    
      function ship:DeplaceHaut()
    
        if ship.posY > 6 then 
            ship.posY = ship.posY - 6
        else
            ship.posY = 6
        end
    
      end
    
      function ship:DeplaceBas()
    
        if ship.posY < love.graphics.getHeight() - 110 then
            ship.posY = ship.posY + 6
        else
            ship.posY = love.graphics.getHeight() - 110
        end
    
      end
    
      function ship:MoteurOn()
        ship.engine = true
      end
    
      function ship:MoteurOff()
        ship.engine = false
      end
   
      function ship:Localisation()
            return ship.posX, ship.posY 
       end
      
    return ship

end

return shipModel