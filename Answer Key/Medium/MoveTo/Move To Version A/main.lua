-- «« Hack BI 2018
-- «« Difficulty: Medium 
-- «« Objective: Fill in the missing code so that:
--      1. The player moves towards the mouse cursor when the left mouse button is clicked.  
--      2. The player's score increases when it collides with the fruit.  The fruit's location then changes to a random location but has to be entirely on the screen
--      3. The player's color changes to a random color when the right mouse button is clicked.
--      4. A sound is played when the player collides with a fruit
--      5. A different sound is played when the player's score is greater than 10

--      •Bonus Challenge: Add code that restricts the player from leaving the screen.
--          add this code in love.update // if player.x > width-player.w then player.x = width-player.w end, etc
--      •Bonus Question: How would you determine the width or height of the fruit image without hardcoidng the values as variables? 
--          Answer: player.img:getWidth(), player.img:getHeight()

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page


function love.load()
    --Declare variables equal to the screen width and height.
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    --Declare variables called xDest and yDest with placeholder values that the character will head towards.
    xDest = width/2
    yDest = height/2

    --Loads the sound file that will play when the player scores
    scoreSound = love.audio.newSource("coin1.wav", "static")

    --Load the sound file that will play when the player's score is greater than 10
    tenSound = love.audio.newSource("coin2.wav", "static")

    --Declare the player table with values corresponding to width, height, x position, y position, speed, score, and color
    player = {
        x = width/2,
        y = height/2,
        w = 32,
        h = 32, 
        speed = 300,
        score = 0,
        color = {255,255,255}
    }

    --Declare the fruit table with values corresponding to width, height, x position, y position, the fruit image, and score.
    fruit = {
        w = 16,
        h = 16, 
        x = math.random(0,width-16),
        y = math.random(0,height-16),
        img = love.graphics.newImage("food.png"),
        score = 0
    }



end 

function love.draw()
    --Reset the color to be plain white
    love.graphics.setColor(255,255,255)

    --Draw the player's score in the top left corner of the screen.
    --Construct the string that will be displayed so that it reads "Score: n" where n is the player's score 
    love.graphics.print("Score: "..player.score, 10, 10)

    --Set color to player's colors
    love.graphics.setColor(player.color[1], player.color[2], player.color[3])

    --Draw player as a rectanlge
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
    
    --Reset the color, otherwise the fruit image will have a tint of whatever color we just set.
    love.graphics.setColor(255,255,255)

    --Draw the fruit.
    love.graphics.draw(fruit.img, fruit.x, fruit.y)   
end 

function love.update(dt)
    --Check if the player has collided with the fruit, if it has:
        --Change the fruit's x,y coordinates toa random location while keeping the fruit entirely on the screen
        --Increase the player's score
        --Check if the player's score and play the corresponding audio file 
    if CheckCollision(player.x ,player.y, player.w, player.h, fruit.x ,fruit.y, fruit.w, fruit.h) then 
        fruit.x = math.random(0,width-fruit.w)
        fruit.y = math.random(0,height-fruit.h)
        player.score = player.score + 1

        --Checks to see if player's score is > 10 
        if player.score > 10 then 
            love.audio.play(tenSound)
        else
            love.audio.play(scoreSound)
        end
    end 

    --Check the players x,y coordinates to the xDest,yDest coordinates and change the player's x,y coordinates accordingly
    if player.x < xDest then 
        player.x = player.x + player.speed*dt
    end 

    if player.x > xDest then 
        player.x = player.x - player.speed*dt
    end 

    if player.y > yDest then 
        player.y = player.y - player.speed*dt
    end 

     if player.y < yDest then 
        player.y = player.y + player.speed*dt
    end 


end 

function love.mousepressed(x, y, button, istouch)
    --Decalre an if statement that checks which button is beng pressed. 
        --if the left mouse button is clicked, set the xDest & yDest variables to the x,y coordinates of the click
        --If the right mouse button is clicked, set the players color values to be a random number on the rgb scale 
    if button == 1 then 
        xDest = x
        yDest = y
    elseif button == 2 then 
        player.color[1] = math.random(0,255)
        player.color[2] = math.random(0,255)
        player.color[3] = math.random(0,255)
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