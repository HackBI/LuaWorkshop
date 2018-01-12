-- «« Hack BI 2018
-- «« Difficulty: Medium 
-- «« Objective: Fill in the missing code so that:
--      1. The player moves towards the mouse cursor when the left mouse button is clicked.  
--      2. The player's score increases when it collides with the fruit.  The fruit's location then changes to a random location but has to be entirely on the screen
--      3. The player's color changes to a random color when the right mouse button is clicked.
--      4. A sound is played when the player collides with a fruit
--      5. A different sound is played when the player's score is greater than 10

--      •Bonus Challenge: Add code that restricts the player from leaving the screen.
--
--      •Bonus Question: How would you determine the width or height of the fruit image without hardcoidng the values as variables? 
--          Answer:

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page


function love.load()
    --Declare variables equal to the screen width and height.
    width = 
    height = 

    --Declare variables called xDest and yDest with placeholder values that the character will head towards.
    xDest = 
    yDest = 

    --Loads the sound file that will play when the player scores
    --Syntax --  love.audio.newSource("filepath", "mode")
    scoreSound = love.audio.newSource("coin1.wav", "static")

    --Load the sound file that will play when the player's score is greater than 10
    tenSound = 

    --Declare the player table with values corresponding to width, height, x position, y position, speed, score, and color
    player = {
        
        color = {}
    }

    --Declare the fruit table with values corresponding to width, height, x position, y position, the fruit image, and score.
    fruit = {
        
    }



end 

function love.draw()
    --Reset the color to be plain white

    --Draw the player's score in the top left corner of the screen.
    --Construct the string that will be displayed so that it reads "Score: n" where n is the player's score 

    --Set color to player's colors

    --Draw player as a rectanlge
    
    --Reset the color, otherwise the fruit image will have a tint of whatever color we just set.

    --Draw the fruit.
end 

function love.update(dt)
    --Check if the player has collided with the fruit, if it has:
        --Change the fruit's x,y coordinates toa random location while keeping the fruit entirely on the screen
        --Increase the player's score
        --Check if the player's score and play the corresponding audio file 
    if CheckCollision() then 

        --Check to see if player's score is > 10
            --player the corresponding sound 
        
    end 

    --Check the players x,y coordinates to the xDest,yDest coordinates and change the player's x,y coordinates accordingly
    if player.x < xDest then 
        player.x = player.x + player.speed*dt
    end 


end 

function love.mousepressed(x, y, button, istouch)
    --Decalre an if statement that checks which button is beng pressed. 
        --if the left mouse button is clicked, set the xDest & yDest variables to the x,y coordinates of the click
        --If the right mouse button is clicked, set the players color values to be a random number on the rgb scale 
    
end 


-- Collision detection function.
-- Returns true if two boxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first box, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second box
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end