require("anAL")
require("player")

Zombie = {}

function Zombie:new()

	z = {}
	 	z.x = math.random(0,love.graphics.getWidth())
		z.y = math.random(0,love.graphics.getHeight())

		z.speed = 50
        z.angle  = math.atan2(character.y-z.y, character.x-z.x)
        z.rotSpeed = 5

  		z.img = love.graphics.newImage("img/zombie/zombieSheet.png")
    	z.frameW = 42
    	z.frameH = 43
    	z.w = z.img:getWidth()
		z.h = z.img:getHeight()

		z.animChase = newAnimation(z.img, z.frameW, z.frameH, 0.15, 0)
		z.animIdle = newAnimation(z.img, z.frameW, z.frameH, 0.15, 1)
   		
    	z.state = "Chasing" --Chasing, Attacking

	setmetatable(z, { __index = Zombie })

	table.insert(horde, z)
	return z
end 

function Zombie:draw()

	if self.state == "Chasing" then 
  		self.animChase:draw(self.x, self.y, self.angle, 1,1, self.frameW/2, self.frameH/2)
 	elseif self.state =="Idle" then  
    	self.animIdle:draw(self.x, self.y, self.angle, 1,1, self.frameW/2, self.frameH/2)
  	end
end 

function Zombie:update(dt)

	if multiplayer then
	  	if love.keyboard.isDown("up") then
		    self.x = self.x + math.cos(self.angle) * self.speed * dt 
		    self.y = self.y + math.sin(self.angle) * self.speed * dt
		    self.animChase:update(dt)
		    self.state = "Chasing"

		elseif love.keyboard.isDown('down') then
		    self.x = self.x - math.cos(self.angle) * self.speed/2 * dt
		    self.y = self.y - math.sin(self.angle) * self.speed/2 * dt
		    self.animChase:update(dt)
		    self.state = "Chasing"

		else 
	 		self.animIdle:update(dt)
			self.state = "Idle"
		end

		if love.keyboard.isDown('left') then
	    	self.angle = self.angle - self.rotSpeed * dt
		end
		if love.keyboard.isDown('right') then
	    	self.angle = self.angle + self.rotSpeed * dt
		end

	else 
		self.state = "Chasing"
		self.animChase:update(dt)
		--Auto point at Character
		self.angle  = math.atan2(character.y-self.y, character.x-self.x)
		--Moves zombie relative to player.x
		if self.x < character.x then 
			self.x = self.x + self.speed*dt
		elseif self.x > character.x then 
			self.x = self.x - self.speed*dt
		end 

		--Moves zombie relative to player.y
		if self.y < character.y then 
			self.y = self.y + self.speed*dt
		elseif self.y > character.y then 
			self.y = self.y - self.speed*dt
		end 
	end 


	if self.x >= love.graphics.getWidth() - self.frameW/2 then 
		self.x = love.graphics.getWidth() - self.frameW/2
	end 
	if self.x <= 0 + self.frameW/2 then 
		self.x = self.frameW/2
	end 

	if self.y >= love.graphics.getHeight() - self.frameH/2 then 
		self.y = love.graphics.getHeight() -  self.frameH/2 
	end 
	if self.y < self.frameH/2 then 
		self.y = self.frameH/2 
	end 
end




