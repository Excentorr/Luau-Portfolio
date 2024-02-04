local ts = game:GetService("TweenService")
local door1 = game.Workspace.AutomaticDoor.door2
local door2 = game.Workspace.AutomaticDoor.door1



script.Parent.ClickDetector.MouseClick:Connect(function()

	script.Parent.Color = Color3.new(1, 0, 0)

	local openTween1 = ts:Create(door1, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		CFrame = door1.CFrame * CFrame.new(0, 0, -7.5)
	})

	local openTween2 = ts:Create(door2, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		CFrame = door2.CFrame * CFrame.new(0, 0, 7.5)
	})

	openTween1:Play()
	openTween2:Play()

	openTween1.Completed:Wait()
	task.wait(2)


	local closeTween1 = ts:Create(door1, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		CFrame = door1.CFrame * CFrame.new(0, 0, 7.5)
	})

	local closeTween2 = ts:Create(door2, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		CFrame = door2.CFrame * CFrame.new(0, 0, -7.5)
	})

	closeTween1:Play()
	closeTween2:Play()
	
	closeTween1.Completed:Wait()

	script.Parent.Color = Color3.new(0, 1, 0)

end)