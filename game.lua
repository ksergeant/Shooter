local game = {}

game.mySpriteManager = require("spriteManager")
game.myTileSheetList = require("tileSheetList")
game.myTirManager = require("tirManager")
game.nbrTirTirer = 0

function game:Load()
  
  --local slime = {} 
 -- slime.nameFile = game.myTileSheetList.Monsters.GreenSlime.nameFile
 -- slime.IdleMap = game.myTileSheetList.Monsters.GreenSlimeIdle.map
 -- slime.WalkRight = game.myTileSheetList.Monsters.GreenSlimeWalkRight.map
  
  --local keyGolden = {}
 -- keyGolden.nameFile = game.myTileSheetList.DungeonCollectables16x16.nameFile
 -- keyGolden.Animated = game.myTileSheetList.CollectableObject.GoldenKey.map

  game.background = love.graphics.newImage("PNG/game_background_3.png")
  game.mySpriteManager:CreateSprite("Player", "PNG/Ship_01/Ship_LVL_1.png", 100, 100, nil)
  game.mySpriteManager:SettingSprite("Player", 700, 600, 0, 0, 1)
  game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_2",".png","Images")
  game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_3",".png","Images")
  game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_4",".png","Images")
  game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_5",".png","Images")
  game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_Effects/Exhaust_1_1",".png","Effets")
  
  game.mySpriteManager:SettingSprite("Player", 700, 600, 0, 0, 1, 1)

end

function game:Update(dt)
  
  self.mySpriteManager:Update(dt)
  self.myTirManager:Update(dt)

  if love.keyboard.isDown("left") then

    self.mySpriteManager:Deplace("Player", "left")
    
  elseif love.keyboard.isDown("right") then

    self.mySpriteManager:Deplace("Player", "right")

  elseif love.keyboard.isDown("up") then

    self.mySpriteManager:Deplace("Player", "up")

  elseif love.keyboard.isDown("down") then

    self.mySpriteManager:Deplace("Player", "down")

  else

    self.mySpriteManager:FermeLesMoteurs("Player")

  end
    
end

function game:Draw()
  
  love.graphics.draw(game.background,0,0,0,0.8,0.8,0,0)
  
  self.mySpriteManager:Draw()
  self.myTirManager:Draw()
  
  love.graphics.print("Nombre de tirs:"..tostring(#self.myTirManager.list_tirs)
  .." Nombre de sprite:"..tostring(#self.mySpriteManager.list_sprites)
  
  ,0,0)
end

return game