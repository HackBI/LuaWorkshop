require("anAL")

Player = {}

function Player:load()
	o = {}
		o.x = 30
		o.y = 30

		o.rotSpeed = 5
    	o.angle = 0

  		o.img = love.graphics.newImage("img/soldier/soldierSheet.png")
    	o.frameW = 38
    	o.frameH = 33
    	o.w = o.img:getWidth()
		o.h = o.img:getHeight()

		o.speed = 200
		o.boost = 300
		o.score = 0
		o.highscore = 0
		o.health = 500

		o.animWalk = newAnimation(o.img, o.frameW, o.frameH, 0.1, 0)
		o.animIdle = newAnimation(o.img, o.frameW, o.frameH, 0.1, 1)
   		
    	o.state = "Idle" --Idle, Walking
	setmetatable(o, { __index = Player })
	return o 
end 

function Player:draw()
	--Player:drawHealthBar()

	if self.state == "Walking" then 
  		self.animWalk:draw(self.x, self.y, self.angle, 1,1, self.frameW/2, self.frameH/2)
 	elseif self.state =="Idle" then  
    	self.animIdle:draw(self.x, self.y, self.angle, 1,1, self.frameW/2, self.frameH/2)
  	end
end 

function Player:update(dt)

  	if love.keyboard.isDown("w") then
	    self.x = self.x + math.cos(self.angle) * self.speed * dt 
	    self.y = self.y + math.sin(self.angle) * self.speed * dt
	    self.animWalk:update(dt)
	    self.state = "Walking"

	elseif love.keyboard.isDown("s") then
	    self.x = self.x - math.cos(self.angle) * self.speed/2 * dt
	    self.y = self.y - math.sin(self.angle) * self.speed/2 * dt
	    self.animWalk:update(dt)
	    self.state = "Walking"

	else 
 		self.animIdle:update(dt)
		self.state = "Idle"
	end

	if love.keyboard.isDown("a") then
    	self.angle = self.angle - self.rotSpeed * dt
	end
	if love.keyboard.isDown("d") then
    	self.angle = self.angle + self.rotSpeed * dt
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

--[[
function Player:drawHealthBar()
	print(self.health, "self.health")

	if self.health >= 1 then 
		--red
		love.graphics.setColor(200, 0,10)
		--draw red rect.
		love.graphics.rectangle("fill", self.x-self.frameW/2, self.y-self.frameH, self.frameW*500/300, 5)

		--green
		love.graphics.setColor(0, 200,10)
		--draw health bar
		love.graphics.rectangle("fill", self.x-self.frameW/2, self.y-self.frameH, self.frameW*self.health/300, 5)
		
		--white
		love.graphics.setColor(255, 255, 255)
	else 
		love.graphics.print("DEAD", self.x-self.frameW/2, self.y-self.frameH, self.frameW*500/300, 5)
	end
end 
]]--

