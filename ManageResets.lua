-- PURPOSE: Manages all the parts and determines if a player needs to be reset
-- REFERENCES:
-- https://devforum.roblox.com/t/detect-if-player-looks-at-part/1830346/4

-- Workspace Vars
local reset_1 = workspace:WaitForChild("Reset1")
local cam = workspace.CurrentCamera
local player = game:GetService("Players").LocalPlayer
local is_reset_1_on_screen = select(2, cam:WorldToViewportPoint(reset_1.Position))

-- Reset Vars
local reset_1_counter = 0 -- Checks locally how long a player has stared at reset_1 part
local reset_timer = 2 -- Minimum amt of seconds a player needs to look at a part b4 resetting


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
				break
			end
		end
	end
end
