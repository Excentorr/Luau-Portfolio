local turret = script.Parent  -- The turret object
local barrel = turret:WaitForChild("Barrel")  -- The part representing the barrel
local bulletModel = game.ReplicatedStorage:WaitForChild("Bullet")  -- The model of the bullet

local radius = 200  -- The radius within which the turret detects players
local bulletSpeed = 500  -- The speed at which the bullet travels

-- Function to calculate the direction towards a target
local function getDirection(target)
	return (target.Position - barrel.Position).Unit
end

-- Function to create and shoot a bullet towards a target
local function shootBullet(target)
	
	local bullet = bulletModel:Clone()
	bullet.Parent = workspace
	bullet.Position = barrel.Position
	bullet.Velocity = getDirection(target) * bulletSpeed
	
	bullet.Touched:Connect(function(hit)
		
		if hit then

			local humanoid = hit.Parent:FindFirstChild("Humanoid")
			local humanoid2 = hit.Parent.Parent:FindFirstChild("Humanoid")

			if humanoid then
				humanoid.Health -= 10
			elseif humanoid2 then
				humanoid2.Health -= 10
			end
			
		end
			
	end)
		
end

-- Function to rotate the barrel towards a target
local function rotateBarrel(target)
	local direction = getDirection(target)
	local lookVector = Vector3.new(direction.X, 0, direction.Z).Unit
	barrel.CFrame = CFrame.lookAt(barrel.Position, barrel.Position + lookVector)
end

-- Function to check for nearby players and shoot at them
local function checkForPlayers()
	while true do
		for _, player in ipairs(game.Players:GetPlayers()) do
			if (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then
				local distance = (player.Character.HumanoidRootPart.Position - barrel.Position).Magnitude
				if distance <= radius then
					rotateBarrel(player.Character.HumanoidRootPart)
					shootBullet(player.Character.HumanoidRootPart)
				end
			end
		end
		wait(1)  -- Adjust the delay between checks as needed
	end
end

-- Start checking for players
checkForPlayers()