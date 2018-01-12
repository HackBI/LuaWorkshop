-- «« Hack BI 2018
-- «« Difficulty: Easy  
-- «« Objective: Fill in the missing code so that:
--      1. When the user clicks the screen, a circle is drawn with its center at the mouse click's position
--      2. The circle should grow in size over time
--      3. The circle's transparency should decrease over time 
--      4. The circle should not be drawn if it has faded entirely

-- Goodluck! The wiki and Hack BI staff are your friends.
-- https://love2d.org/wiki/Main_Page

function love.load()
	--Declare the variables xPosition and yPosition with any placeholder integer value.
	

	--Declare a variable called alpha with a value of 255 
	--Use this value to decrease the the transparency of the circle over time.  
	--Hint: the method love.graphics.setColor(r,g,b,a) takes 4 arguments.

	--Declare a variable called radius with a value of 0

	--Declare a variable called startGrow with a boolean value of false

end 

function love.draw()
	--Set the background color to a light blue
	
	--Set the color to be white and pass the parameter alpha as the 4th argument

	--Draw a circle with the "line" draw style, 8 segments and use the corresponding parameters we declared in love.load() for the other arguments 

end 

function love.update(dt)
	--Check to see if the boolean value declared in love.load() is true 
	--If so:
		--Make the radius variable increase at a steady rate by making use of the dt parameter
		--Make the alpha variable decrease at a steady rate by making use of the dt parameter
	if  then 
		
	end 

	--Check to see if the circle has faded entirely 
	--If so:
		--reset all of the necessary variables to their initial vlaues (startGrow, alpha, radius)
	if  <= then
		 
	end 
end 

function love.mousepressed(x, y, button, istouch)
	--Set the xPosition and yPosition variables equal to the x and y parameters of the love.mousepressed() function
	

	--Reset all of the necessary variables to their initial values (startGrow, alpha, radius)
	
end 