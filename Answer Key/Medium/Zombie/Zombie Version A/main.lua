-- «« Hack BI 2018
-- «« Difficulty: Medium 
-- «« Objective: Fill in the missing code so that:
--      1. The zombie moves towards the mouse cursor when the left mouse button is clicked.  
--      2. The zombie's score increases when it collides with the fruit.  The fruit's location then changes to a random location but has to be entirely on the screen
--      3. A sound is played when the zombie collides with a fruit
--      4. A different sound is played when the zombie's score is greater than 10

--      •Bonus Challenge: Add code that restricts the zombie from leaving the screen.
--          add this code in love.update // if zombie.x > width-zombie.w then zombie.x = width-zombie.w end, etc
--      •Bonus Question: How would you determine the width or height of the fruit image without hardcoidng the values as variables? 
--          Answer: zombie.img:getWidth(), zombie.img:getHeight()

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

function love.load()
    --Declare variables equal to the screen width and height.
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    --Declare variables called xDest and yDest with placeholder values that the character will head towards.
    xDest = width/2
    yDest = height/2

    --Decare variables called mouseX and mouseY and set them equal to the mouses location
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    --Loads the sound file that will play when the zombie scores`
    scoreSound = love.audio.newSource("coin1.wav", "static")

    --Load the sound file that will play when the zombie's score is greater than 10
    tenSound = love.audio.newSource("coin2.wav", "static")

    --Declare the zombie table with values corresponding to width, height, x position, y position, speed, score, and color
    zombie = {}
        zombie.x = width/2
        zombie.y = height/2
        zombie.img = love.graphics.newImage("zombie.png")
        zombie.w = zombie.img:getWidth()
        zombie.h = zombie.img:getHeight()
        zombie.speed = 300
        zombie.score = 0
        zombie.angle  = math.atan2(mouseY-zombie.y, mouseX-zombie.x)

    --Declare the fruit table with values corresponding to width, height, x position, y position, the fruit image, and score.
    fruit = {
        w = 16,
        h = 16, 
        x = math.random(0,width),
        y = math.random(0,height),
        img = love.graphics.newImage("food.png"),
        score = 0
    }

end 

function love.draw()
    --Reset the color to be plain white
    love.graphics.setColor(255,255,255)
    --Set the background color to a light green so we can see the zombie
    love.graphics.setBackgroundColor(0,150,100)

    --Draw the zombie's score in the top left corner of the screen.
    --Construct the string that will be displayed so that it reads "Score: n" where n is the zombie's score 
    love.graphics.print("Score: "..zombie.score, 10, 10)

    --Draw zombie
    love.graphics.draw(zombie.img, zombie.x, zombie.y, zombie.angle, 1, 1, zombie.img:getWidth()/2, zombie.img:getHeight()/2)
    
    --Reset the color, otherwise the fruit image will have a tint of whatever color we just set.
    love.graphics.setColor(255,255,255)

    --Draw the fruit.
    love.graphics.draw(fruit.img, fruit.x, fruit.y)   
end 

function love.update(dt)
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
                                --mouseY, exchangeable with yDest
    zombie.angle = math.atan2(mouseY-zombie.y, mouseX-zombie.x) 

    --Check if the zombie has collided with the fruit, if it has:
        --Change the fruit's x,y coordinates toa random location while keeping the fruit entirely on the screen
        --Increase the zombie's score
        --Check if the zombie's score and play the corresponding audio file 
    if CheckCollision(zombie.x ,zombie.y, zombie.w, zombie.h, fruit.x ,fruit.y, fruit.w, fruit.h) then 
        fruit.x = math.random(0,width-fruit.w)  
        fruit.y = math.random(0,height-fruit.h)
        zombie.score = zombie.score + 1

        --Checks to see if zombie's score is > 10 
        if zombie.score > 10 then 
            love.audio.play(tenSound)
        else
            love.audio.play(scoreSound)
        end
    end 

    --Check the zombies x,y coordinates to the xDest,yDest coordinates and change the zombie's x,y coordinates accordingly
    if zombie.x < xDest then 
        zombie.x = zombie.x + zombie.speed*dt
    end 

    if zombie.x > xDest then 
        zombie.x = zombie.x - zombie.speed*dt
    end 

    if zombie.y > yDest then 
        zombie.y = zombie.y - zombie.speed*dt
    end 

     if zombie.y < yDest then 
        zombie.y = zombie.y + zombie.speed*dt
    end 


end 

function love.mousepressed(x, y, button, istouch)
    --Decalre an if statement that checks which button is beng pressed. 
        --if the left mouse button is clicked, set the xDest & yDest variables to the x,y coordinates of the click
        --If the right mouse button is clicked, set the zombies color values to be a random number on the rgb scale 
    if button == 1 then 
        xDest = x
        yDest = y
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