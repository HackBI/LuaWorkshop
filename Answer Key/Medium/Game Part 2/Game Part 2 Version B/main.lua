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

--Require the animation library "anAL"
require()

function love.load()
  --Declare a table called player with keys x, y, angle, speed, img, and rotSpeed.  Refer to Game Part 1 for the corresponding values
  player = {
    x = ,
    y = ,
    angle = ,
  	img = ,
    frameW = ,
    frameH = ,
  	speed = ,
   	rotSpeed = ,
    state =  --Idle, Walking
}

  --Declare a variable called animWalk and set it equal to the result of the newAnimation method from the anAL library.  Use the corresponding values from the player table for the arguments of the newAnimation() method, set the speed to 0.1, and the frames to 0 so that the animation loops infinitely.
  --The syntax for the newAnimation method is: newAnimation(image, frame Width, frame height, speed of animation, frames)
  
  --Declare a variable called animIdle and set it equal to the result of the newAnimation method from the anAL library.  Use the corresponding values from the player table for the arguments of the newAnimation() method, set the speed to 0.1, and the frames to 1 so that the animation is only the 1st frame of the sprite sheet.
  

  --Set the background color to somehting that will contrast the colors of the sprite.  We recomend (120,70,70)

end 

function love.draw()

  --Check if the player's state is "Walking" 
    --If so:
      --Draw the Walking animation using the properties of the player table we declared in love.load()  Leave the scaleX and scaleY parameters unmodified, at 1.
      --Make sure the x and y offsets are positioned so that the new origin is in the center of the image
      --Hint: love.graphics.draw(drawable, x, y, scaleX, scaleY, offsetX, offsetY).  Use the suffix :getWidth() to get the width of an image for calculating the center of the image
  --Otherwise check if the player's state is "Idle"
    --If so:
      --Draw the Idle animation using the properties of the player table we declared in love.load()  Leave the scaleX and scaleY parameters unmodified, at 1.

  if  ==  then 
    animWalk:draw()
  elseif  ==  then  
    animIdle:draw()
  end

end 


function love.update(dt)
  --Update the animIdle animation using the :update(dt) suffix at the end of the variable name 
  animIdle:update(dt)
  --Set the player's state equal to "Idle"
  player.state = "Idle"

  --Check if the user presses the up or down arrow keys
  --If so:
    --Replace the question marks with the correct operators and values so that the character moves according to the speed value that we set in love.load(), as well as ensuring that the character moves at a unifrom speed on all machines by using the delta time parameter of love.update()

  if  then
    player.x = player.? ? math.cos(player.?) ? player.? * dt 
    player.y = player.? ? math.sin(player.?) ? player.? * dt
    --Update the animWalk animation

    --Set the player's state to "Walking"

  end

  if  then
    player.x = player.? ? math.cos(player.?) ? player.?/2 * dt
    player.y = player.? ? math.sin(player.?) ? player.?/2 * dt

     --Update the animWalk animation

    --Set the player's state to "Walking"
  end


  --Check if the user presses the left or right arrow keys
  --If so:
    --Replace the question marks with the correct operators and values so that the the angle variable is modified by adding or substracting the rotSpeed variable and making the modification occur at a unifrom speed on all machines by using the deltatime parameter of love.update() 
  if  then
    player.? = player.? - player.? * dt
  end
  if  then
    player.? = player.? + player.? * dt
  end  

  --Check if the right side of the character has gone of the right side of the screen
  --If so:
    --Reposition the character so that it is not going off of the right side of the screen
    --Hint: remember that the character's x and y position are measured from the origin which we offset when we draw it
    -- in love.draw() in order to make the origin the center of the image.
  if  >=  then 
    --Reposition the character so that it is not going off of the right side of the screen
    
  end 

  --Check if the left side of the character has gone of the left side of the screen
  --If so:
    --Reposition the character so that it is not going off of the left side of the screen
  if  <=  then 
    --Reposition the character so that it is not going off of the left side of the screen

  end 

  --Check if the top side of the character has gone of the top side of the screen
  --If so:
    --Reposition the character so that it is not going off of the top side of the screen
  if >= then 
    --Reposition the character so that it is not going off of the top side of the screen
    
  end 


  --Check if the bottom side of the character has gone of the bottom side of the screen
  --If so:
    --Reposition the character so that it is not going off of the bottom side of the screen
  if  <  then 
    --Reposition the character so that it is not going off of the bottom side of the screen
  end 
end


