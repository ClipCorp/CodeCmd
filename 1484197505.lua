function Reselect()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		local Highlight = Instance.new("Highlight",game:GetService("Workspace").CurrentCamera)
		Highlight.FillTransparency = 1
		Highlight.Adornee = v.Character
		Highlight.Name = v.DisplayName
	end
end

Reselect()

game:GetService("Players").PlayerAdded:Connect(function(player)
	for i,v in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do
		if v:IsA("Highlight") then
			v:Destroy()
		end
	end
    Reselect()
end)

game:GetService("Players").PlayerRemoving:Connect(function(player)
	game:GetService("Workspace").CurrentCamera:WaitForChild(player.DisplayName):Destroy()
end)

while wait() do
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.Status.Role.Value == "Murderer" then
			for i,h in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do
				if h:IsA("Highlight") and h.Adornee == v.Character then
					h.OutlineColor = Color3.fromRGB(255, 56, 56)
				end
			end
		end
			if v.Status.Role.Value == "Bystander" and v.Status.HasRevolver.Value == true then
				for i,h in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do
					if h:IsA("Highlight") and h.Adornee == v.Character then
						h.OutlineColor = Color3.fromRGB(88, 152, 255)
					end
				end
			end
				if v.Status.Role.Value == "Bystander" and v.Status.HasRevolver.Value == false then
					for i,h in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do
						if h:IsA("Highlight") and h.Adornee == v.Character then
							h.OutlineColor = Color3.fromRGB(90, 255, 78)
						end
					end
				end
			end
end
