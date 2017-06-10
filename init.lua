local take_screenshot
local delay = 20
local time
local last_ran

core.register_globalstep(function(dtime)
	if not take_screenshot then
		return
	end
	time = time + dtime
	if time - last_ran >= delay then
		last_ran = time
		minetest.take_screenshot()
	end
end)

core.register_chatcommand("start", {
	description = core.gettext("Start Recording"),
	params = "<delay>",
	func = function(param)
		if param ~= "" then
			delay = tonumber(param)
		end
		last_ran = -delay + 1
		time = 0
		take_screenshot = true
		return true
	end,
})

core.register_chatcommand("stop", {
	description = core.gettext("Stop Recording"),
	func = function(param)
		take_screenshot = false
		return true
	end,
})
