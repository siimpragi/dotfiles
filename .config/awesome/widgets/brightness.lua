-------------------------------------------------
-- Brightness Widget for Awesome Window Manager
-- Shows the brightness level of the laptop display
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/brightness-widget

-- @author Pavel Makhov
-- @copyright 2017-2019 Pavel Makhov
-------------------------------------------------

local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")

local GET_BRIGHTNESS_CMD = "xbacklight -get"
local INC_BRIGHTNESS_CMD = "xbacklight -inc 5%"
local DEC_BRIGHTNESS_CMD = "xbacklight -dec 5%"

local widget = {}

local function worker(args)

    local args = args or {}

    local get_brightness_cmd = args.get_brightness_cmd or GET_BRIGHTNESS_CMD
    local inc_brightness_cmd = args.inc_brightness_cmd or INC_BRIGHTNESS_CMD
    local dec_brightness_cmd = args.dec_brightness_cmd or DEC_BRIGHTNESS_CMD

    local brightness_text = wibox.widget.textbox()

    widget = wibox.widget {
        brightness_text,
        layout = wibox.layout.fixed.horizontal,
    }

    local update_widget = function(widget, stdout, _, _, _)
        local brightness_level = tonumber(string.format("%.0f", stdout))
        widget:set_text(" bright:" .. brightness_level .. "% ")
    end,

    widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 4) then
            spawn(inc_brightness_cmd, false)
        elseif (button == 5) then
            spawn(dec_brightness_cmd, false)
        end
    end)

    watch(get_brightness_cmd, 1, update_widget, brightness_text)

    return widget
end

return setmetatable(widget, { __call = function(_, ...)
    return worker(...)
end })
