local tirModel = {}

function tirModel:Create(pName, pNameFile, pTileWidth, pTileHeight, pWho, pType, pMap)

    local tir = {}
    print("Dans le tirModel")
  
    --print(pName)
    --print(pNameFile)
    --print(pTileWidth)
    --print(pTileHeight)
    --print(pMap)
  
    tir.posX = 0
    tir.posY = 0
    tir.name = pName
    tir.oX = 0
    tir.oY = 0
    tir.type = nil
    tir.currentImage = 1
    tir.frames = 1
    tir.style = false
    tir.listImages = {}
    tir.listEffet = {}
  
    local imageTempo = love.graphics.newImage(pNameFile)
    table.insert(tir.listImages, imageTempo)
  
    if (pMap ~=nil) then
      tir.tileSheet = tileSheetModel:CreateTileSheet(pNameFile, pTileWidth, pTileHeight, pMap)
      tir.frames = tir.tileSheet.frames
      tir.style = true
    end

end

return tirModel