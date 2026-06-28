# PHẦN 3 - Waybar Tokyo Night

Sau phần này bạn sẽ có một Waybar kiểu như:

```css
  1 2 3 4 5          Firefox           🔊 50%  🧠 24% 🌐 WiFi  🔋 89%  🕒22:15
```

## Bước 1

Tạo thư mục

```bash
mkdir -p ~/.config/waybar
```

## Bước 2

Tạo file

```bash
touch ~/.config/waybar/config.jsonc
touch ~/.config/waybar/style.css
```

## Bước 3

config.jsonc

```json
{
    "layer": "top",
    "position": "top",
    "height": 36,

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
        "tooltip": false
    },

    "hyprland/workspaces": {
        "format": "{name}"
    },

    "hyprland/window": {
        "max-length": 60
    },

    "cpu": {
        "format": " {usage}%"
    },

    "memory": {
        "format": "󰍛 {}%"
    },

    "network": {
        "format-wifi": " {essid}",
        "format-ethernet": "󰈀 Ethernet",
        "format-disconnected": "󰖪 Offline"
    },

    "pulseaudio": {
        "format": "{icon} {volume}%",
        "format-muted": "󰝟",
        "format-icons": {
            "default": [
                "",
                "",
                ""
            ]
        }
    },

    "battery": {
        "format": " {capacity}%"
    },

    "clock": {
        "format": " {:%H:%M  %d/%m}"
    },

    "tray": {
        "spacing": 10
    }
}
```

### Giải thích

#### modules-left

```txt


Workspace
```

#### modules-center

```txt
Firefox

VSCode

Foot
```

#### modules-right

```txt
CPU

RAM

WiFi

Volume

Battery

Clock

Tray
```

## Bước 4

### style.css

Đây mới là phần đẹp.

```css
* {
    font-family: "JetBrainsMono Nerd Font";
    font-size: 14px;
    min-height: 0;
}

window#waybar {
    background: rgba(26,27,38,0.85);
    color: #c0caf5;

    border-radius: 0;

    border-bottom: 2px solid #7aa2f7;
}

#custom-arch {
    color: #7aa2f7;

    font-size: 20px;

    margin-left: 10px;

    margin-right: 12px;
}

#workspaces button {

    color: #7aa2f7;

    padding: 0 10px;

    margin: 5px;

    border-radius: 8px;

}

#workspaces button.active {

    background: #7aa2f7;

    color: #1a1b26;

}

#window {

    color: #c0caf5;

    font-weight: bold;

}

#cpu,
#memory,
#network,
#pulseaudio,
#battery,
#clock,
#tray {

    background: rgba(65,72,104,0.7);

    padding: 0 12px;

    margin: 5px;

    border-radius: 8px;

}
```

## Bước 5

Reload

```bash
killall waybar

waybar
```

Hoặc

```bash
Super + R
```

nếu đã thêm

```txt
bind = SUPER, R, exec, hyprctl reload
```

## Sau khi hoàn thành 

🟦 Logo Arch

🟦 Workspace

🟦 Tên cửa sổ

🟦 CPU

🟦 RAM

🟦 WiFi

🟦 Âm lượng

🟦 Pin

🟦 Đồng hồ

🟦 System Tray

