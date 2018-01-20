-- «« Hack BI 2018
-- «« Difficulty: Hard  
-- «« Objective: Fill in the missing code so that:
--      1. A number of animated balloons float up from the bottom of the screen
--      2. When the user clicks on a balloon
--			a. A pop sound is player
--			b. The balloon pops
--			c. The player's score increases 
--			d. The balloon respawns at the bottom of the screen
--      3. When a balloon reaches the top of the screen
--			a. The player's health decreases
--			d. The balloon respawns at the bottom of the screen

-- This module contains multiple complex programming concepts regarding tables, loops, and instance properties.  Writing out out what you need to accomplish may help

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

--Require the animation library "An Animation Library" file called anAL
require("anAL")
--Require the balloons file

function love.load()
	--Declare a table called balloons

	--Declare a variable to control how many balloons get spawned called numBalloons, for now, set it equal to 5

	--Declare a variable called health and set it equal to 3

	--Declare a variable called score and set it equal to 0


	--Declare a variable called font and set it equal to a new font (the default font if no font is specified) with a size of 20

	--Set the font to be the font you just declared

	--Declare string called loseText and set it equal to a message to impart defeat upon the user such as "All the balloons got away :("


	--Decalare a variable called popSound and set it equal to a new audio source which will be the pop.mp3 file in this main directory


	--Using a for loop that will iterate according to the numBalloons variable
		--Create a new balloon using the Balloon:create() constructor in balloons.lua
	for  =  ,  do 

	end 
	
	--Set the background color to a light pastel.  We recomend 252, 182, 182

end 

function love.draw()
	--Check if the user's health is greater than 0
	--If so:
		--Iterate through the balloons table using a      for k,v in pairs()      loop.  and draw all of the items within the balloon table using the Balloon:draw() method.
		--Hint: k is a variable which equals the key, and v is a variable that equals the value of whatever table you give pass as the argument  
	--Otherwise:
		--Display the loseText variable we declared in love.load()
	if  >  then 
		for k, v in pairs( ) do 
			
		end

		--In the top left corner, display a string that says something along the lines of "Score: " and concatenate the user's score to the end

		--In the top left corner, but immidiately to the right of the textfield we just drew, display another string which says "Health: " and concatenate the user's health to the end
		--Hint: Because we declared the font as a variable in love.load, you can use the :getWidth() method to get the width of a string written in that font.  With that information, you can draw the health textbox immidiately to the right of the score textbox.

	else 
		--Display the loseText variable 

	end
end

function love.update(dt)
	--Check if the user's health is greater than 0
	--If so:
		--Iterate through the balloons table using a      for k,v in pairs()      loop.  and update all of the items within the balloon table using the Balloon:update() method.  
		--Don't forget to pass the dt argument into all update functions
	if  >  then 
		for k, v in pairs( ) do 

		end
	end 
end 

function love.mousepressed(x, y, button, istouch)
	--Iterate through the balloons table using a      for k,v in pairs()      loop.  
		--Check if the user click on a balloon using the insideBox() method, the x,y arguments of the love.mousepressed function, and the x,y,width,height properties of each item in the balloons table
		--If so:
			--Increase the player's score by 1
			--Change the state property of each item in the balloons table to "popped"
			--Play the popSound that we loaded in love.load()
	for k,v in pairs( ) do 
		if insideBox( , , , , , ) then 
 


 		end 
	end 

	--Check if the user's health is less than or equal to 0 AND if the user clicks on the loseText using the insideBox() method and the font:getWidth() 
	--If so:
		--Iterate through the balloons table using a      for k,v in pairs()      loop.  and reset each item in the balloons table using the Balloon:reset() method 
		--Reset the user's health to 3
		--Reset the user's score to 0

	if  <=  and insideBox( , , , ,  ) then
		for k, v in pairs( ) do 
			
		end

		--Reset the user's health to 3
 
 		--Reset the user's score to 0

	end
end 



-- Point-collision detection function.
-- Returns true if a point and a rectangle overlap, false if they don't
-- px,py are the coords of the point, while w1,h1 are its width and height
-- x,y, w,h are the coords, width and height of the rectangle
function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end