local tirModel = {}

function tirModel:Create(pName, pNameFile, x, y, pWho, pType, pMap)

    local tir = {}
    print("Dans le tirModel")
  
    --print(pName)
    --print(pNameFile)
    --print(pTileWidth)
    --print(pTileHeight)
    --print(pMap)
  
    tir.posX = x
    tir.posY = y
    tir.name = pName
    tir.oX = 0
    tir.oY = 0
    tir.type = nil
    tir.currentImage = 1
    tir.frames = 1
    tir.style = false
    tir.listImages = {}
    tir.listEffet = {}
    tir.who = pWho
    tir.delete = false
  
    local imageTempo = love.graphics.newImage(pNameFile)
    table.insert(tir.listImages, imageTempo)
  
    if (pMap ~=nil) then
      tir.tileSheet = tileSheetModel:CreateTileSheet(pNameFile, pTileWidth, pTileHeight, pMap)
      tir.frames = tir.tileSheet.frames
      tir.style = true
    end

    return tir

end

return tirModel