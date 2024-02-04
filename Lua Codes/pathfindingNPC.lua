local pfs = game:GetService("PathfindingService")

local humanoid = script.Parent:WaitForChild("Humanoid")
local endLocation = script.Parent.Parent.EndPoint.Position


local path = pfs:CreatePath()
path:ComputeAsync(script.Parent:WaitForChild("HumanoidRootPart").Position, endLocation)

local points = path:GetWaypoints()

for i, v in pairs (points) do
	humanoid:MoveTo(v.Position)
	humanoid.MoveToFinished:Wait()
end