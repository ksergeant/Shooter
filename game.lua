local game = {}

game.mySpriteManager = require("spriteManager")
game.myTileSheetList = require("tileSheetList")
game.myTirManager = require("tirManager")
game.myKeyManager = require("keyManager")
game.myShipManager = require("shipManager")
game.myEnemyManager = require("enemyManager")

game.nbrTirTirer = 0

function game:Load()

  game.background = love.graphics.newImage("PNG/game_background_3.png")

  local shipPlayerListImages = {}
  local shipPlayerListEffets = {}

  shipPlayerListImages[1] = "PNG/Ship_01/Ship_LVL_1.png"
  shipPlayerListEffets[1] = "PNG/Ship_Effects/Exhaust_1_1.png"

  local enemyShipListImages = {}
  local enemyShipListEffets = {}

  enemyShipListImages[1] = "PNG/Enemy-spaceship-game-sprites/PNG/Ships/Ship_01.png"
  enemyShipListEffets[1] = "PNG/Ship_Effects/Exhaust_1_1.png"


  game.myShipManager:CreateShip("Player", 700, 600, "Player", shipPlayerListImages, shipPlayerListEffets)
  game.myEnemyManager:CreateEnemy("Enemy", 200, 200, "Enemy", enemyShipListImages, enemyShipListEffets)
  --game.mySpriteManager:CreateSprite("Player", "PNG/Ship_01/Ship_LVL_1.png", 100, 100, nil)
  --game.mySpriteManager:SettingSprite("Player", 700, 600, 0, 0, 1)
  --game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_2",".png","Images")
  --game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_3",".png","Images")
  --game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_4",".png","Images")
  --game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_01/Ship_LVL_5",".png","Images")
  --game.mySpriteManager:AjoutImageSprite("Player","PNG/Ship_Effects/Exhaust_1_1",".png","Effets")
  
  --game.mySpriteManager:SettingSprite("Player", 700, 600, 0, 0, 1, 1)

end

function game:Update(dt)
  
  self.mySpriteManager:Update(dt)
  self.myTirManager:Update(dt)
  self.myKeyManager:Update(key, self)
  self.myShipManager:Update(dt)
  self.myEnemyManager:Update(dt)
 
end

function game:Draw()
  
  love.graphics.draw(game.background,0,0,0,0.8,0.8,0,0)
  
  self.mySpriteManager:Draw()
  self.myTirManager:Draw()
  self.myShipManager:Draw()
  self.myEnemyManager:Draw()

  love.graphics.print("Nombre de tirs:"..tostring(#self.myTirManager.list_tirs)
  .." Nombre de sprite:"..tostring(#self.mySpriteManager.list_sprites)
  .." Nombre de ship:"..tostring(#self.myShipManager.list_ships)
  ,0,0)
end

return game