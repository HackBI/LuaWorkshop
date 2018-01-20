-- «« Hack BI 2018
-- «« Difficulty: Medium 
-- «« Objective: Fill in the missing code so that:
--      1. The zombie moves towards the mouse cursor when the left mouse button is clicked.  
--      2. The zombie's score increases when it collides with the fruit.  The fruit's location then changes to a random location but has to be entirely on the screen
--      3. A sound is played when the zombie collides with a fruit
--      4. A different sound is played when the zombie's score is greater than 10

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

function love.load()
    --Declare variables equal to the screen width and height.
    width = 
    height = 

    --Declare variables called xDest and yDest with placeholder values that the character will head towards.
    xDest =
    yDest = 

    --Decare variables called mouseX and mouseY and set them equal to the mouses location
    mouseX = 
    mouseY = 

    --Loads the sound file that will play when the zombie scores
    scoreSound = 

    --Load the sound file that will play when the zombie's score is greater than 10
    tenSound = 

    --Declare the zombie table with values corresponding to width, height, x position, y position, speed, score, and color
    zombie = {}
        zombie.x = 
        zombie.y = 
        zombie.img = 
        zombie.w = 
        zombie.h = 
        zombie.speed = 
        zombie.score = 
                        --math.atan2 returns the arctangent of 2 arguments
        zombie.angle  = math.atan2(mouseY-zombie.y, mouseX-zombie.x)

    --Declare the fruit table with values corresponding to width, height, x position, y position, the fruit image, and score.
    fruit = {
        w = ,
        h = , 
        x =  , 
        y = ,
        img = ,
        score = 
    }

end 

function love.draw()
    --Reset the color to be plain white

    --Set the background color to a light green so we can see the zombie.  We recomend 0,150,100


    --Draw the zombie's score in the top left corner of the screen.
    --Construct the string that will be displayed so that it reads "Score: n" where n is the zombie's score
    --Hint: Use .. to concatenate a varable to the end of a string 


    --Draw the zombie using properties of the zombie table that correspond to the necessary arguments of the love.graphics.draw()
    --Hint: love.graphics.draw(drawable, x, y, rotation, scaleX, scaleY, orientationX, orientationY)

    
    --Reset the color, otherwise the fruit image will have a tint of whatever color we just set.


    --Draw the fruit using properties of the fruit table that correspond to the necessary arguments of the love.graphics.draw()

end 

function love.update(dt)
    --Set mouseX to the current x location of the mouse

    --Set mouseY to the current y location of the mouse


    --Update the angle property of of the zombie table by calling the same math.atan2 method that we used in love.load()
    zombie.angle = math.atan2(mouseY-zombie.y, mouseX-zombie.x) 

    --Check if the zombie has collided with the fruit, 
        --If so:
            --Change the fruit's x,y coordinates to a random location while keeping the fruit entirely on the screen
            --Increase the zombie's score by 1 
            --Check if the zombie's score is greater than 10 
                --If so
                    --Play the corresponding audio file 
                --Otherwise:
                    --Play the default score sound
    if CheckCollision( ) then 
        --Change the fruit's x,y coordinates to a random location while keeping the fruit entirely on the screen
        fruit.x = 
        fruit.y = 
        --Increase the zombie's score
        zombie.score = 

        --Checks to see if zombie's score is > 10 
        if  >  then 
            --Play the tenSound 

        else
            --Play the default score sound
        end
    end 

    --Compare the zombii's x,y coordinates to the xDest,yDest coordinates and change the zombie's x,y coordinates so that the zombie moves towards the xDest,yDest 
    
    --Check if zombie.x is less than xDest
    if  <  then 
        --Increase zombie.x by zombie.speed and dt
        zombie.x = 
    end 

    --Check if zombie.x is greater than xDest
    if  >  then 

        --Decrease zombie.x by zombie.speed and dt
        zombie.x = 
    end 

    --Check if zombie.y is greater than yDest
    if  >  then 
        --Decrease zombie.y by zombie.speed and dt
        zombie.y = 
    end 

     --Check if zombie.y is less than yDest
     if  <  then 
        --Increase zombie.y by zombie.speed and dt
        zombie.y = 
    end 


end 

function love.mousepressed(x, y, button, istouch)
    --Decalre an if statement that checks which button is beng pressed. 
        --if the left mouse button is clicked, set the xDest & yDest variables to the x,y coordinates of the click
        --If the right mouse button is clicked, set the zombies color values to be a random number on the rgb scale 
    if  ==  then 
        xDest = 
        yDest = 
    end 
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