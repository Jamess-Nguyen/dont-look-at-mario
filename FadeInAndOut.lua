-- PURPOSE: Fade in and out blocks eventually this will need
-- to be extended to increment piont values

-- Workspace vars
local reset_part = script.Parent
local tween_service = game:GetService("TweenService")

-- Fade Vars
local fade_time = 2
local min_visible_time = 4
local extra_random_visible_time = 2
local max_fade_transparency = 0.2
reset_part.Transparency = max_fade_transparency -- Maxmimum it can fade it kinda like .2 opacity

local function tween_transparency(target, duration)
	local tween_info = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = tween_service:Create(reset_part, tween_info, { Transparency = target })
	tween:Play()
	tween.Completed:Wait()
end


while true do
	-- Fade in and print when it's visible
	tween_transparency(0, fade_time)
	print(reset_part.Name .. " is now fully visible")

	-- Maintain visiblity
	task.wait(min_visible_time + math.random(0, extra_random_visible_time * 10) / 10)

	-- Fade out
	tween_transparency(max_fade_transparency, fade_time)

	-- Random delay & output B4 next fade in
	local wait_time = math.random(2, 5)
	print(string.format("%s will fade in again in %.1f seconds", reset_part.Name, wait_time))
	task.wait(wait_time)
end
