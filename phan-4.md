# PHẦN 4 - Waybar Pro

### Giao diện mục tiêu

```txt
  1 2 3 4 5      Firefox                     🔊 🧠 💾 🌐 🔋 🕒 
```

Mỗi module đều có:

- icon đẹp
- tooltip
- click
- scroll
- animation

## Bước 1

Mở

```bash
~/.config/waybar/config.jsonc
```

Đổi thành:

```json
{
    "layer": "top",
    "position": "top",
    "height": 34,
    "spacing": 8,

    "modules-left": [
        "custom/arch",
        "hyprland/workspaces"
    ],

    "modules-center": [
        "hyprland/window"
    ],

    "modules-right": [
        "cpu",
        "memory",
        "network",
        "pulseaudio",
        "battery",
        "clock",
        "tray"
    ],

    "custom/arch": {
        "format": "",
        "tooltip": "Arch Linux",
        "on-click": "rofi -show drun"
    },

    "hyprland/workspaces": {
        "disable-scroll": false,
        "all-outputs": true
    },

    "hyprland/window": {
        "separate-outputs": true,
        "max-length": 55
    },

    "cpu": {
        "interval": 2,
        "format": " {usage}%",
        "tooltip": true
    },

    "memory": {
        "interval": 2,
        "format": "󰍛 {}%"
    },

    "network": {
        "format-wifi": " {essid}",
        "format-ethernet": "󰈀 Ethernet",
        "format-disconnected": "󰖪 Offline",
        "tooltip-format": "{ipaddr}"
    },

    "pulseaudio": {
        "scroll-step": 5,
        "format": "{icon} {volume}%",
        "format-muted": "󰝟",
        "format-icons": {
            "default": [
                "",
                "",
                ""
            ]
        },
        "on-click": "pavucontrol"
    },

    "battery": {
        "format": "{icon} {capacity}%",
        "format-icons": [
            "󰂎",
            "󰁺",
            "󰁻",
            "󰁼",
            "󰁽",
            "󰁾",
            "󰁿",
            "󰂀",
            "󰂁",
            "󰂂",
            "󰁹"
        ]
    },

    "clock": {
        "format": " {:%H:%M}",
        "tooltip-format": "<big>{:%A %d %B %Y}</big>"
    },

    "tray": {
        "spacing": 10
    }
}
```

## Bước 2

Đây mới là phần tạo nên vẻ đẹp.

Mở

```bash
~/.config/waybar/style.css
```

Xóa hết.

Dán:

```css
* {
    font-family: "JetBrainsMono Nerd Font";
    font-size: 14px;
    border: none;
}

window#waybar {

    background: rgba(26,27,38,0.82);

    color: #c0caf5;

    transition-duration: .3s;

}

#custom-arch {

    color: #7aa2f7;

    font-size: 24px;

    margin-left: 12px;

    margin-right: 16px;

}

#workspaces button {

    color: #7aa2f7;

    background: transparent;

    margin: 4px;

    padding: 0 10px;

    border-radius: 8px;

}

#workspaces button.active {

    color: #1a1b26;

    background: #7aa2f7;

}

#workspaces button:hover {

    background: #414868;

}

#window {

    font-weight: bold;

}

#cpu,
#memory,
#network,
#pulseaudio,
#battery,
#clock,
#tray {

    background: rgba(65,72,104,.65);

    border-radius: 10px;

    padding: 0 12px;

    margin: 4px;

}

#clock {

    color: #7dcfff;

}

#battery {

    color: #9ece6a;

}

#network {

    color: #7aa2f7;

}

#memory {

    color: #bb9af7;

}

#cpu {

    color: #ff9e64;

}

#pulseaudio {

    color: #f7768e;

}
```

## Bước 3

Reload

```bash
killall waybar
waybar &
```

Hoặc

```bash
Super + R
```

## Sau khi hoàn thành 

Bạn sẽ có

✅ Waybar bo góc

✅ Màu Tokyo Night

✅ Workspace đẹp

✅ Tooltip

✅ CPU

✅ RAM

✅ WiFi

✅ Battery

✅ Volume

✅ Clock

✅ Tray
