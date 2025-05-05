-- PURPOSE: Fade in and out blocks eventually this will need
-- to be extended to increment piont values

-- Workspace vars
local reset_part = script.Parent
local tween_service = game:GetService("TweenService")

-- Fade Vars
local fade_time = 2
local min_visible_time = 3.5
local extra_random_visible_time = 2
local max_fade_transparency = 0.99
reset_part.Transparency = max_fade_transparency -- Maxmimum it can fade it kinda like .2 opacity

-- Global Score Var
local Players = game:GetService("Players")
local player
repeat
	player = Players:GetPlayers()[1]
	task.wait()
until player
local leaderstats = player:WaitForChild("leaderstats")
local score = leaderstats:WaitForChild("Score")

local function tween_transparency(target, duration)
	local tween_info = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = tween_service:Create(reset_part, tween_info, { Transparency = target })
	tween:Play()
	tween.Completed:Wait()
end

-- Verifies that the player is alive
local function is_player_alive()
	local char = player.Character
	local humanoid = char and char:FindFirstChildOfClass("Humanoid")
	return humanoid and humanoid.Health > 0
end

while true do
	-- Fade in and print when it's visible
	tween_transparency(0, fade_time)
	print(reset_part.Name .. " is now fully visible")

	-- Maintain visiblity
	task.wait(min_visible_time + math.random(0, extra_random_visible_time * 10) / 10)

	-- Fade out & increment score value
	tween_transparency(max_fade_transparency, fade_time)
	if is_player_alive() and player and score then
		score.Value = score.Value + 1
		print(string.format("%s Incrementing Score Value, %f", reset_part.Name, score.Value))
	end
	-- Random delay & output B4 next fade in
	local wait_time = math.random(.5, 1)
	print(string.format("%s will fade in again in %.1f seconds", reset_part.Name, wait_time))
	task.wait(wait_time)
end
