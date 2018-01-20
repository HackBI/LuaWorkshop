-- «« Hack BI 2018
-- «« Difficulty: Easy  
-- «« Objective: Fill in the missing code so that:
--      1. The character image is drawn on the screen 
--      2. rotates around the center of the image to the left or right when the user presses the corresponding arrow keys
--      3. The character moves forward or backward when the user presses the corresponding arrow keys.
--      4. The character does not go off of the screen

--      Bonus Question: What line causes the character to move slower when going backwards compared to forwards
--                      lines 50 & 51 divide speed/2 

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

function love.load()
  --Declare variables called x and y and set them both equal to 100
  x,y = 100,100
  --Declare a variable called angle and set its value to 0
	angle = 0
  --Declare a variable called image and set it equal to a new image using the love.graphics.newImage() function.  Pass the name of the sprite.png image in this directory in quotations as the argument.
	image = love.graphics.newImage("sprite.png")
  --Declare a variable called speed and set it to any multiple of 100.  We recomend a number between 200 and 500.
	speed = 400
  --Declare a variable called rotSpeed and set it to 5.  Adjustable as well.
 	rotSpeed = 5

  --Set the background color to somehting that will contrast the colors of the sprite.  We recomend (120,70,70)
  love.graphics.setBackgroundColor(120,70,70)
end 

function love.draw()
  --Draw the image using the variables we declared in love.load.  Leave the scaleX and scaleY parameters unmodified, at 1.
  --Make sure the x and y offsets are positioned so that the new origin is in the center of the image
  --Hint: love.graphics.draw(drawable, x, y, scaleXx, scaleY, offsetX, offsetY).  Use the suffix :getWidth() to get the width of an image for calculating the center of the image
	love.graphics.draw(image, x, y, angle, 1, 1, image:getWidth()/2, image:getHeight()/2)
end 

function love.update(dt)
  --Check if the user presses the up or down arrow keys
  --If so:
    -- fill in the 2 missing operators and the 6 missing values so that the character moves according to the speed value 
    --that we set in love.load(), as well as ensuring that the character moves at a unifrom speed on all machines by using 
    --the delta time parameter of love.update()

  if love.keyboard.isDown("up") then
    x = x + math.cos(angle) * speed * dt 
    y = y + math.sin(angle) * speed * dt
  end
  if love.keyboard.isDown('down') then
    x = x - math.cos(angle) * speed/2 * dt
    y = y - math.sin(angle) * speed/2 * dt
  end


  --Check if the user presses the left or right arrow keys
  --If so:
    --Modify the angle variable by adding or substracting the rotSpeed variable and making the modification occur at a
    --unifrom speed on all machines by using the deltatime parameter of love.update() 
  if love.keyboard.isDown('left') then
    angle = angle - rotSpeed * dt
  end
  if love.keyboard.isDown('right') then
    angle = angle + rotSpeed * dt
  end  

  --Check if the right side of the character has gone of the right side of the screen
  --If so:
    --Reposition the character so that it is not going off of the right side of the screen
    --Hint: remember that the character's x and y position are measured from the origin which we offset when we draw it
    -- in love.draw() in order to make the origin the center of the image.
  if x >= love.graphics.getWidth() - image:getWidth()/2 then 
    x = love.graphics.getWidth() - image:getWidth()/2
  end 

  --Check if the left side of the character has gone of the left side of the screen
  --If so:
    --Reposition the character so that it is not going off of the left side of the screen
  if x <= image:getWidth()/2 then 
    x = image:getWidth()/2
  end 

  --Check if the top side of the character has gone of the top side of the screen
  --If so:
    --Reposition the character so that it is not going off of the top side of the screen
  if y >= love.graphics.getHeight() - image:getHeight()/2 then 
    y = love.graphics.getHeight() - image:getHeight()/2
  end 


  --Check if the bottom side of the character has gone of the bottom side of the screen
  --If so:
    --Reposition the character so that it is not going off of the bottom side of the screen
  if y < image:getHeight()/2 then 
    y = image:getHeight()/2
  end 
end


