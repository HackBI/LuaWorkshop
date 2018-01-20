--Require the animation library "An Animation Library" file called anAL
require("anAL")

--Decalare a table called Balloon.  This will be the template that we use to create all the actual balloons which we spawn in main.lua.  Think of it as an object rather than a table
Balloon = {}


--Declare a function called Balloon:create()  --By this means that the :create() method is a property of any Balloon
function Balloon:create()
	--This line sets the random seed to be the current time in case the balloons don't appear to be spawning in random locations
	love.math.setRandomSeed(os.time())

	--Declare a table called b -- This is the table that will be returned by the Balloon:create() method
	b = {}
		--Declare a table which will be a property of the b table called imgs.  Inside of the table declare the path to all the balloon images.  The first one is done for you.

		--Hint: the syntax to do this is b.nameOfProperty 
		--i.e:   b.string = "I'm a string which is a property of the b table"  
		b.imgs = {"imgs/balloonSprite.png", "imgs/balloonSprite_blue.png", "imgs/balloonSprite_green.png", "imgs/balloonSprite_yellow.png"}

		--Declare a variable as a property of the b table called img.  Set it's value to a new image which is equal to a random item from the b.imgs table you just declared.
		--Hint:   1. You will need to get a random number between 1 and the number of items in the b.imgs table
				--2. Use this random number as the index to reference an item within the b.imgs table
				--3. You will need to convert this value to a string to pass as the file path use by the love.graphics.newImage() method.   
		b.img = love.graphics.newImage(tostring(b.imgs[math.random(0,4)]))
		--Declare variables which will be properties of the b table called frameW and frameH which equal the width and height of one frame of the balloon sprite sheets.  (Each frame is uniform in width and height so one variable will work for all of sprite sheets)
		--The dimensions of one frame are 23 by 56
		b.frameW = 23
		b.frameH = 56

		--Declare a variable as a property of the b table called imgPop and set it equal to a new image which will be the pop sprite sheet
		b.imgPop = love.graphics.newImage("imgs/pop.png")
		--Declare variables which will be properties of the b table called popW and popH which equal the width and height of one frame of the pop sprite sheet.  
		--The dimensions of one frame of the pop sprite sheet are 23 by 56 49 by 56	
		b.popW = 49
		b.popH = 56

		--Declare a variable as a property of the b table called b.x and set it equal to a random location between 0 plus the width of one frame of the balloon sprite sheet, and the width of the screen minus the width of one frame of the balloon sprite sheet
		--This will randomly position the balloon on the x axis while keeping the balloon entirely on the screen 
		b.x = math.random(b.frameW, love.graphics.getWidth()-b.frameW)
		--Declare a variable as a property of the b table called b.y and set it equal to a random location between the height of the screen, and the height of the screen + 500
		--This will randomly position the balloon on the y axis somewhere below the bottom of the screen 
		b.y = math.random(love.graphics.getHeight(), love.graphics.getHeight()+500)

		--Declare a variable as a property of the b table called speed and set it equal to 0		
		b.speed = 0

		--Declare a variable as a property of the b table called animFloat and set it equal to a new animation using the animation library
		--Hint: The syntax to create a new animation is: newAnimation(image, frame width, frame height, speed of animation, number of loops)
		--Use properties of the b table for the first three arguments, then set the speed to be a small (fast) speed such as .1, and set the number of loops to be 0 so that the animation loops infinitely
		b.animFloat = newAnimation(b.img, b.frameW, b.frameH, .1, 0)
		--Declare a variable as a property of the b table called animPop and set it equal to a new animation using the animation library
		--Use properties of the b table for the first three arguments, then set the speed to be a small (faster) speed such as .05, and set the number of loops to be 1 
		b.animPop = newAnimation(b.imgPop, b.popW, b.popH, .05, 1)

		--Declare a variable as a property of the b table called state and set it equal to the string "floating"
		--We will use this to determine the state of each balloon.  The two options are floating, and popped
		b.state = "floating" --floating, popped
		--Declare a variable as a property of the b table called animTimer and set it equal to 5
		b.animTimer = 5

	--This lets us reference the values of the b table as part of the Balloon table
	setmetatable(b, { __index = Balloon })

	--Insert the b table into the balloons table
	table.insert(balloons, b)

	--Return the b table
	return b
end 

--Declare a function called Balloon:draw()
function Balloon:draw()
	--We need to reference each individual balloon, not the template balloon.  We do this by refering to the table that calls this function as "self".  This way we modify the values of the table that calls this function, not the template.
	--Check if the self.state property is equal to "floating"
	--If so:
		--Call the animFloat:draw() method annd pass in x and y values of the self table for the location to draw the animation
	--Otherwise:
		--Call the animPop:draw() method annd pass in x and y values of the self table for the location to draw the animation

	--The first half of this if statement has already been completed for you, finish the second half so that the pop animation is drawn
	if self.state == "floating" then 
		self.animFloat:draw(self.x, self.y)
	elseif self.state == "popped" then
		self.animPop:draw(self.x, self.y)
	end 
end 

--Declare a function called Balloon:update(dt)
function Balloon:update(dt)
	--Check if the self.state property is equal to "floating"
	--If so:
		--Update the self.animFloat animation 
		--Increase the speed property of the self table by 20 and multiply this value by dt so that the speed is consistent across all computers.  Play with this value to increase/decrease the rate of acceleration for the balloons
		
		--Check if the y property of the self table is greater than 0 minus the frameH property of the self table -- This will check if the balloon is entirely on the screen on the y axis 
			--If so: 
				--Decrease the y property of the self table by the speed property of the self table and multiply this by dt so that the speed is consistent across all computers.
			--Otherwise: 
				--Decrease the health variable by 1 
				--Reset the self object by calling the :reset() method declared below
	--Otherwise check if the self.state property is equal to "popped"
	--If so:
		--Check if the animTimer property of the self object is less than 0.
		--If so:
			--Reset the self object by calling the :reset() method declared below
		--Otherwise:
			--Decrease the animTimer property of the self object by 1 
			--Update the animPop animation of the self object by calling the :update(dt) method

	if self.state == "floating" then 

		self.animFloat:update(dt)
		self.speed = self.speed + 20 *dt

		if self.y > 0 - self.frameH then 
			self.y = self.y - self.speed*dt
		else 
			health = health - 1 
			self:reset()
		end
	elseif self.state == "popped" then 

		if self.animTimer < 0 then 
			self:reset()
		else 
			self.animTimer = self.animTimer - 1
			self.animPop:update(dt)
		end 

	end 
end 


--Declare a function called Balloon:reset()
function Balloon:reset()
	--Set the y property of the self object to be the height of the window
	self.y = love.graphics.getHeight()
	--Set the x property of the self object equal to a random location between 0 plus the width of one frame of the balloon sprite sheet, and the width of the screen minus the width of one frame of the balloon sprite sheet
	self.x = math.random(self.frameW, love.graphics.getWidth()-self.frameW)

	--Set the speed property of the self object to 0
	self.speed = 0
	--Set the state property of the self object to "floating"
	self.state = "floating"
	--Set the animTimer property of the self object to 10
	self.animTimer = 10
end 