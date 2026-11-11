-- Equivalent of modules/key_binds.conf
local progs = require("modules.my_programs")

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(progs.terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(progs.fileManager))
hl.bind(mainMod .. " + D", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.resize({ x = 1000, y = 700 }))
    hl.dispatch(hl.dsp.window.center())
end)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(progs.menu))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(progs.browser))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/lock_anim.sh"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | ~/.config/rofi/clipboard/launcher.sh | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("killall wlogout || wlogout"))
hl.bind("print", hl.dsp.exec_cmd("env HYPRSHOT_DIR=/home/nstcrystal/Pictures/Screenshots hyprshot -m output"))
-- hl.bind(mainMod .. " + print", hl.dsp.exec_cmd("hyprshot -m region --raw | satty --filename -"))
hl.bind(mainMod .. " + print", hl.dsp.exec_cmd("hyprshot -m region --raw | wl-copy"))
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd(progs.color))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill rofi || ~/.config/rofi/wallpaper/wall.sh"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("pkill rofi || kitty --class nmtui -e nmtui"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd("swayosd-client --brightness -10"))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd("swayosd-client --brightness +10"))
hl.bind(mainMod .. " + F6", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"))
hl.bind(mainMod .. " + F7", hl.dsp.exec_cmd("swayosd-client --output-volume -15"))
hl.bind(mainMod .. " + F8", hl.dsp.exec_cmd("swayosd-client --output-volume 15 --max-volume 100"))
hl.bind("Caps_Lock", hl.dsp.exec_cmd("sleep 0.2; swayosd-client --caps-lock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
