-- PURPOSE: Manages all the parts and determines if a player needs to be reset
-- REFERENCES:
-- https://devforum.roblox.com/t/detect-if-player-looks-at-part/1830346/4

-- Workspace Vars
local reset_1 = workspace:WaitForChild("Reset1")
local cam = workspace.CurrentCamera
local player = game:GetService("Players").LocalPlayer

-- Reset 
local reset_timer = 2 -- Minimum amt of seconds a player needs to look at a part b4 resetting

local reset_1 = workspace:WaitForChild("Reset1")
local is_reset_1_on_screen = select(2, cam:WorldToViewportPoint(reset_1.Position))
local reset_1_counter = 0 -- Checks locally how long a player has stared at reset_1 part

local reset_2 = workspace:WaitForChild("Reset2")
local is_reset_2_on_screen = select(2, cam:WorldToViewportPoint(reset_2.Position))
local reset_2_counter = 0 -- Checks locally how long a player has stared at reset_2 part

local reset_3 = workspace:WaitForChild("Reset3")
local is_reset_3_on_screen = select(2, cam:WorldToViewportPoint(reset_3.Position))
local reset_3_counter = 0 -- Checks locally how long a player has stared at reset_3 part

local reset_4 = workspace:WaitForChild("Reset4")
local is_reset_4_on_screen = select(2, cam:WorldToViewportPoint(reset_4.Position))
local reset_4_counter = 0 -- Checks locally how long a player has stared at reset_4 part

-- Global Vars
-- Global Score Var
local leaderstats = player:WaitForChild("leaderstats")
local score = leaderstats:WaitForChild("Score")

-- Verifies that the player is alive
local function is_player_alive()
	local char = player.Character
	local humanoid = char and char:FindFirstChildOfClass("Humanoid")
	return humanoid and humanoid.Health > 0
end

-- Verifies which parts are currently present on screen.
-- Eventually will be need to be scaled for N parts
local function check_reset()
	is_reset_1_on_screen = select(2, cam:WorldToViewportPoint(reset_1.Position))
	is_reset_2_on_screen = select(2, cam:WorldToViewportPoint(reset_2.Position))
	is_reset_3_on_screen = select(2, cam:WorldToViewportPoint(reset_3.Position))
	is_reset_4_on_screen = select(2, cam:WorldToViewportPoint(reset_4.Position))

end

-- Checks which parts are visible on the screen and if any of them are
-- visible for reset_timer seconds then the player will be reset
while true do
	task.wait(0.1)
	check_reset()

	if reset_1.Transparency == 0 and is_reset_1_on_screen and is_player_alive() then
		reset_1_counter = 0

		while reset_1.Transparency == 0 and is_reset_1_on_screen and is_player_alive() do
			task.wait(1)
			check_reset()
			reset_1_counter = reset_1_counter + 1
			print(string.format("Reset1 Counter: %d", reset_1_counter))

			if reset_1_counter > reset_timer then
				if player.Character then
					player.Character:BreakJoints()
				end
				reset_1_counter = 0
				score.Value = 0
				print("ALERT ALERT: RESETTING SCORE TO 0")
				break
			end
		end
	end

	if reset_2.Transparency == 0 and is_reset_2_on_screen and is_player_alive() then
		reset_2_counter = 0

		while reset_2.Transparency == 0 and is_reset_2_on_screen and is_player_alive() do
			task.wait(1)
			check_reset()
			reset_2_counter = reset_2_counter + 1
			print(string.format("Reset2 Counter: %d", reset_2_counter))

			if reset_2_counter > reset_timer then
				if player.Character then
					player.Character:BreakJoints()
				end
				reset_2_counter = 0
				score.Value = 0
				print("ALERT ALERT: RESETTING SCORE TO 0")
				break
			end
		end
	end

	if reset_3.Transparency == 0 and is_reset_3_on_screen and is_player_alive() then
		reset_3_counter = 0

		while reset_3.Transparency == 0 and is_reset_3_on_screen and is_player_alive() do
			task.wait(1)
			check_reset()
			reset_3_counter = reset_3_counter + 1
			print(string.format("Reset3 Counter: %d", reset_3_counter))

			if reset_3_counter > reset_timer then
				if player.Character then
					player.Character:BreakJoints()
				end
				reset_3_counter = 0
				score.Value = 0
				print("ALERT ALERT: RESETTING SCORE TO 0")
				break
			end
		end
	end

	if reset_4.Transparency == 0 and is_reset_4_on_screen and is_player_alive() then
		reset_4_counter = 0

		while reset_4.Transparency == 0 and is_reset_4_on_screen and is_player_alive() do
			task.wait(1)
			check_reset()
			reset_4_counter = reset_4_counter + 1
			print(string.format("Reset4 Counter: %d", reset_4_counter))

			if reset_4_counter > reset_timer then
				if player.Character then
					player.Character:BreakJoints()
				end
				reset_4_counter = 0
				score.Value = 0
				print("ALERT ALERT: RESETTING SCORE TO 0")
				break
			end
		end
	end
	
end
