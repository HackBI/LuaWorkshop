-- «« Hack BI 2018
-- «« Difficulty: Easy  
-- «« Objective: Fill in the missing code so that:
--      1. A line is drawn connecting two points on the screen
--      2. When the user clicks with the left mouse button, one of the point's x,y location should change to be the location of the click.  When the user clicks with the right mouse button, the other point's x,y location should change to be the location of the click. 
--      3. A blue circle should be drawn at the same location as the vertice that corresponds to the left mouse click, and a red circle should be drawn at the same location that corresponds with the right mouse click in order to tell the two points apart from each other.
--      4. The distance between the two points should be displayed somewhere on the screen.

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

function love.load()
    --Declare variables called leftX and leftY and set them equal to arbitrary placeholder values such as 10 and 20
    leftX = 10
    leftY = 20

    --Declare variables called rightX and rightY and set them equal to arbitrary placeholder values such as 300 and 400
    rightX = 300
    rightY = 400

    --Declare a variable called dist and set it equal to the distance between the left and right point using math.dist method and the 4 variables we just declared
    dist = math.dist(leftX, leftY, rightX, rightY)
end

function love.draw()
     --Set the color to be white
    love.graphics.setColor(255,255,255)

    --Display the distance between the two points
    --Try concatenating the dist variable to the end of a string which says something like "Distance = "
    --Try rounding the distance to be an integer using the math.floor method
    love.graphics.print("Distance = "..math.floor(dist))
    
    --Draw a line that connects the left and right points using the 4 variables declared in love.load()
    love.graphics.line(leftX, leftY, rightX, rightY)

    --Set the color to blue 
    love.graphics.setColor(0,0,255)
     --Draw the blue circle that corresponds with the left point
    love.graphics.circle("fill", rightX, rightY, 8, 8)

    --Set the color to red
    love.graphics.setColor(255,0,0)
     --Draw the red circle that corresponds with the right point
    love.graphics.circle("fill", leftX, leftY, 8, 8)  

end 

function love.mousepressed(x, y, button, istouch)
    --Check if the left mouse button is clicked
    --If so:
        --Set the leftX and leftY variables to the location of the click
    --Otherwise check if the right mousebutton is clicked
    --If so:
        --Set the rightX and rightY variables to the location of the click
    if button == 1 then 
        leftX = x
        leftY = y

    elseif button == 2 then 
        rightX = x 
        rightY = y 
    end 


    --Update the dist variable according to the new values of leftX,leftY and rightX,rightY
    dist = math.dist(leftX, leftY, rightX, rightY)
end 



-- Returns the distance between two points.
function math.dist(x1,y1, x2,y2) 
    return ((x2-x1)^2+(y2-y1)^2)^0.5 
end