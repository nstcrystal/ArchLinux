-- Equivalent of modules/auto_start.conf
hl.on("hyprland.start", function()
    -- hl.exec_cmd("~/.config/hypr/lock_anim.sh")
    hl.exec_cmd("waybar & awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("wl-paste --type text --watch cliphist store &")
    hl.exec_cmd("wl-paste --type image --watch cliphist store &")
    hl.exec_cmd("udiskie")

    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
end)
