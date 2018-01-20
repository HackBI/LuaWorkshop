-- «« Hack BI 2018
-- «« Difficulty: Medium  
-- «« Objective: Fill in the missing code so that:
--      1. The code from Game Part 1 is optimized 
--      2. rotates around the center of the image to the left or right when the user presses the corresponding arrow keys
--      3. The character moves forward or backward when the user presses the corresponding arrow keys.
--      4. The character does not go off of the screen

--      Bonus Question: What line causes the character to move slower when going backwards compared to forwards
--                      lines 50 & 51 divide speed/2 

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

--Require the animation library
require("anAL")

function love.load()
  --Declare a table called player with keys x, y, angle, speed, img, and rotSpeed.  Refer to Game Part 1 if necessary
  player = {
    x = 100,
    y = 100,
    angle = 0,
  	img = love.graphics.newImage("soldierSheet.png"),
    frameW = 38,
    frameH = 33,
  	speed = 200,
   	rotSpeed = 5,
    state = "Idle" --Idle, Walking
}

  --Load animations 
  animWalk = newAnimation(player.img, player.frameW, player.frameH, 0.1, 0)
  animIdle = newAnimation(player.img, player.frameW, player.frameH, 0.1, 1)

  --Set the background color to somehting that will contrast the colors of the sprite.  We recomend (120,70,70)
  love.graphics.setBackgroundColor(120,70,70)
end 

function love.draw()
  --Draw the image using the variables we declared in love.load.  Leave the scaleX and scaleY parameters unmodified, at 1.
  --Make sure the x and y offsets are positioned so that the new origin is in the center of the image
  --Hint: love.graphics.draw(drawable, x, y, scaleXx, scaleY, offsetX, offsetY).  Use the suffix :getWidth() to get the width of an image for calculating the center of the image
	--love.graphics.draw(player.img, player.x, player.y, player.angle, 1, 1, player.img:getWidth()/2, player.img:getHeight()/2)
  if player.state == "Walking" then 
    animWalk:draw(player.x, player.y, player.angle, 1,1, player.frameW/2, player.frameH/2)
  elseif player.state =="Idle" then  
    animIdle:draw(player.x, player.y, player.angle, 1,1, player.frameW/2, player.frameH/2)
  end
end 

function love.update(dt)

  animIdle:update(dt)
  player.state = "Idle"

  --Check if the user presses the up or down arrow keys
  --If so:
    -- fill in the 2 missing operators and the 6 missing values so that the character moves according to the speed value 
    --that we set in love.load(), as well as ensuring that the character moves at a unifrom speed on all machines by using 
    --the delta time parameter of love.update()

  if love.keyboard.isDown("up") then
    player.x = player.x + math.cos(player.angle) * player.speed * dt 
    player.y = player.y + math.sin(player.angle) * player.speed * dt
    animWalk:update(dt)
    player.state = "Walking"
  end
  if love.keyboard.isDown('down') then
    player.x = player.x - math.cos(player.angle) * player.speed/2 * dt
    player.y = player.y - math.sin(player.angle) * player.speed/2 * dt
    animWalk:update(dt)
    player.state = "Walking"
  end


  --Check if the user presses the left or right arrow keys
  --If so:
    --Modify the angle variable by adding or substracting the rotSpeed variable and making the modification occur at a
    --unifrom speed on all machines by using the deltatime parameter of love.update() 
  if love.keyboard.isDown('left') then
    player.angle = player.angle - player.rotSpeed * dt
  end
  if love.keyboard.isDown('right') then
    player.angle = player.angle + player.rotSpeed * dt
  end  

  --Check if the right side of the character has gone of the right side of the screen
  --If so:
    --Reposition the character so that it is not going off of the right side of the screen
    --Hint: remember that the character's x and y position are measured from the origin which we offset when we draw it
    -- in love.draw() in order to make the origin the center of the image.
  if player.x >= love.graphics.getWidth() - player.frameW/2 then 
    player.x = love.graphics.getWidth() - player.frameW/2
  end 

  --Check if the left side of the character has gone of the left side of the screen
  --If so:
    --Reposition the character so that it is not going off of the left side of the screen
  if player.x <= 0 + player.frameW/2 then 
    player.x = player.frameW/2
  end 

  --Check if the top side of the character has gone of the top side of the screen
  --If so:
    --Reposition the character so that it is not going off of the top side of the screen
  if player.y >= love.graphics.getHeight() - player.frameH/2 then 
    player.y = love.graphics.getHeight() -  player.frameH/2 
  end 


  --Check if the bottom side of the character has gone of the bottom side of the screen
  --If so:
    --Reposition the character so that it is not going off of the bottom side of the screen
  if player.y < player.frameH/2 then 
    player.y = player.frameH/2 
  end 
end


