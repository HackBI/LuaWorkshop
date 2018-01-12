-- «« Hack BI 2018
-- «« Difficulty: Easy  
-- «« Objective: Fill in the missing code so that:
--      1. The character image is drawn on the screen 
--      2. rotates around the center of the image to the left or right when the user presses the corresponding arrow keys
--      3. The character moves forward or backward when the user presses the corresponding arrow keys.
--      4. The character does not go off of the screen

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

function love.load()
  --Declare variables called x and y and set them both equal to 100

  --Declare a variable called angle and set its value to 0
	
  --Declare a variable called image and set it equal to a new image using the love.graphics.newImage() function.  Pass the name of the sprite.png image in this directory in quotations as the argument.

  --Declare a variable called speed and set it to any multiple of 100.  We recomend a number between 200 and 500.

  --Declare a variable called rotSpeed and set it to 5.  

  --Set the background color to something that will contrast the colors of the sprite.  We recomend (120,70,70)

end 

function love.draw()
  --Draw the image using the variables we declared in love.load()  Leave the scaleX and scaleY parameters unmodified, at 1.
  --Make sure the x and y offsets are positioned so that the new origin is in the center of the image
  --Hint: love.graphics.draw(drawable, x, y, scaleX, scaleY, offsetX, offsetY).  Use the suffix :getWidth() to get the width of an image for calculating the center of the image

end 

function love.update(dt)
  --Check if the user presses the up or down arrow keys
  --If so:
    -- fill in the 2 missing operators and the 6 missing values so that the character moves according to the speed value 
    --that we set in love.load(), as well as ensuring that the character moves at a unifrom speed on all machines by using 
    --the delta time (dt) parameter of love.update()

  if then
    x = x ? math.cos(?) * ? * ? 
    y = y ? math.sin(?) * ? * ?
  end
  if  then
    x = x ? math.cos(?) ? ?/2 * ?
    y = y ? math.sin(?) ? ?/2 * ?
  end


  --Check if the user presses the left or right arrow keys
  --If so:
    --Modify the angle variable by adding or substracting the rotSpeed variable and making the modification occur at a
    --unifrom speed on all machines by using the delta time parameter of love.update() 

  --Check if the user presses the left arrow key
  if  then
    --Decrease the value of the angle variable...

  end

  --Check if the user presses the right arrow key
  if  then
    --Increase the value of the angle variable...

  end  

  --Check if the right side of the character has gone of the right side of the screen
  --If so:
    --Reposition the character so that it is not going off of the right side of the screen
    --Hint: remember that the character's x and y position are measured from the origin which we offset when we draw it
    -- in love.draw() in order to make the origin the center of the image.
  if  >=  then 

  end 

  --Check if the left side of the character has gone of the left side of the screen
  --If so:
    --Reposition the character so that it is not going off of the left side of the screen
  if  <= then 

  end 



  --Check if the top side of the character has gone of the top side of the screen
  --If so:
    --Reposition the character so that it is not going off of the top side of the screen
  if >= then 

  end 

  --Check if the bottom side of the character has gone of the bottom side of the screen
  --If so:
    --Reposition the character so that it is not going off of the bottom side of the screen
  if < then 

  end 
end


