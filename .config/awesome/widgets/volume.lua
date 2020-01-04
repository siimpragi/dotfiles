-------------------------------------------------
-- Brightness Widget for Awesome Window Manager
-- Shows the brightness level of the laptop display
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/brightness-widget

-- @author Pavel Makhov
-- @copyright 2017-2019 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")
local watch = require("awful.widget.watch")
local spawn = require("awful.spawn")

local GET_VOLUME_CMD = 'amixer -D pulse sget Master'
local INC_VOLUME_CMD = 'amixer -D pulse sset Master 5%+'
local DEC_VOLUME_CMD = 'amixer -D pulse sset Master 5%-'
local TOG_VOLUME_CMD = 'amixer -D pulse sset Master toggle'

local widget = {}

local function worker(args)

    local args = args or {}

    local get_volume_cmd = args.get_volume_cmd or GET_VOLUME_CMD
    local inc_volume_cmd = args.inc_volume_cmd or INC_VOLUME_CMD
    local dec_volume_cmd = args.dec_volume_cmd or DEC_VOLUME_CMD
    local tog_volume_cmd = args.tog_volume_cmd or TOG_VOLUME_CMD

    local volume_text = wibox.widget.textbox()

    widget = wibox.widget {
        volume_text,
        layout = wibox.layout.fixed.horizontal,
    }

    local update_widget = function(widget, stdout, _, _, _)
        local volume = string.match(stdout, "%[(o%D%D?)%]")    -- \[(o\D\D?)\] - [on] or [off]
        local volume_level = string.match(stdout, "(%d?%d?%d)%%")  -- (\d?\d?\d)\%)
        volume_level = tonumber(string.format("% 3d", volume_level))

        if (volume == "on") then
          widget:set_text(" volume:" .. volume_level .. "% ")
        else
          widget:set_text(" volume:muted ")
        end

    end,

    widget:connect_signal("button::press", function(_, _, _, button)
        if (button == 4) then
            awful.spawn(inc_volume_cmd)
        elseif (button == 5) then
            awful.spawn(dec_volume_cmd)
        elseif (button == 1) then
            awful.spawn(tog_volume_cmd)
        end
    end)

    watch(get_volume_cmd, 1, update_widget, volume_text)

    return widget
end

return setmetatable(widget, { __call = function(_, ...)
    return worker(...)
end })
