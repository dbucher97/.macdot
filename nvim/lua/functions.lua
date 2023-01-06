local popup = require("popup")

local function my_input(--[[ title ]])
	popup.create({ border = "round", title = "test" }, {})
end

_G.my_input = my_input
