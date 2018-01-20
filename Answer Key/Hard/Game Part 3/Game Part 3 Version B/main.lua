-- «« Hack BI 2018
-- «« Difficulty: Easy  
-- «« Objective: Fill in the missing code so that:
--      1. The code from Game Part 1 is optimized 
--      2. rotates around the center of the image to the left or right when the user presses the corresponding arrow keys
--      3. The character moves forward or backward when the user presses the corresponding arrow keys.
--      4. The character does not go off of the screen

--      Bonus Question: What line causes the character to move slower when going backwards compared to forwards
--                      lines 50 & 51 divide speed/2 

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page
require("anAL")
require("player")
require("zombie")

function love.load()
  multiplayer = false 
  horde = {}

  if multiplayer then 
    numZombies = 1
  else 
    numZombies = 5 -- how ever many you want
  end

  character = Player:load()
  
  for i = 1,numZombies do 
    Zombie:new()
  end

  -- ipairs starts at table[1] for numbered tables, pairs just goes 
  --[[for k,v in ipairs(horde) do 
    print("k = ",k, "k = ",v)

    for i, q in pairs(v) do 
      print("i = ",i, "q = ",q)
    end
  end ]]--

  --Set the background color to somehting that will contrast the colors of the sprite.  We recomend (120,70,70)
  love.graphics.setBackgroundColor(120,70,70)
end 

function love.draw()
  character:draw()

  for k,v in ipairs(horde) do 
    v:draw()
  end 

end 

function love.update(dt)
  character:update(dt)

  --Everything still goes fast as all get out
  --check video on spawning multiple enemies bc this doesn't work / reference enemy.lua in snake game 
  
  for k,v in ipairs(horde) do
    v:update(dt)
  end

  for k, v in pairs(horde) do 
    if checkCollision(character.x, character.y, character.w, character.h, v.x, v.y, v.w, v.h) then 
      character.health = character.health - 1
      print("character health"..character.health)
    end 
  end

end

-- Collision detection function.
-- Returns true if two boxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first box, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second box
function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end
