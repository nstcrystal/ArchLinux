# Phần 2 - Xây dựng Hyprland theo chuẩn mới

### Cấu trúc thư mục

Trong `~/.config/hypr` tạo các file sau:

```txt
~/.config/hypr/
│
├── hyprland.conf
├── monitors.conf
├── env.conf
├── input.conf
├── appearance.conf
├── animations.conf
├── keybinds.conf
├── windowrules.conf
└── autostart.conf
```

Tạo bằng lệnh:

```bash
touch ~/.config/hypr/{monitors.conf,env.conf,input.conf,appearance.conf,animations.conf,keybinds.conf,windowrules.conf,autostart.conf}
```

## File 1: hyprland.conf

Đây là file chính, chỉ dùng để import các file khác.

```txt
#############################################################
#              Hyprland Configuration
#                  Tokyo Night
#############################################################

source = ~/.config/hypr/monitors.conf
source = ~/.config/hypr/env.conf
source = ~/.config/hypr/input.conf
source = ~/.config/hypr/appearance.conf
source = ~/.config/hypr/animations.conf
source = ~/.config/hypr/keybinds.conf
source = ~/.config/hypr/windowrules.conf
source = ~/.config/hypr/autostart.conf
```

## File 2: monitors.conf

```txt
#############################################################
# Monitor
#############################################################

monitor=,preferred,auto,1
```

## File 3: env.conf

```txt
#############################################################
# Variables
#############################################################

$terminal = foot
$fileManager = thunar
$menu = rofi -show drun

##################################################
# Environment Variables
##################################################

env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORM,wayland
env = SDL_VIDEODRIVER,wayland
env = MOZ_ENABLE_WAYLAND,1
env = CLUTTER_BACKEND,wayland
env = GDK_BACKEND,wayland,x11

env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = LIBVA_DRIVER_NAME,nvidia

```

Sau này đổi terminal chỉ sửa đúng một dòng.

## File 4: input.conf

```txt
#############################################################
# Input
#############################################################

input {

    kb_layout = us

    follow_mouse = 1

    sensitivity = 0

    touchpad {

        natural_scroll = false

        tap-to-click = true

    }

}
```

## File 5: appearance.conf

```txt
general {

    gaps_in = 5

    gaps_out = 10

    border_size = 2

    layout = dwindle

    resize_on_border = true

    col.active_border = rgba(7aa2f7ff)

    col.inactive_border = rgba(414868ff)

}

decoration {

    rounding = 12

    active_opacity = 1.0

    inactive_opacity = 0.95

    fullscreen_opacity = 1.0

    shadow {

        enabled = true

        range = 15

        render_power = 3

    }

    blur {

        enabled = true

        size = 8

        passes = 3

        vibrancy = 0.2

    }

}
```

Tokyo Night sẽ rất đẹp với bộ màu này.

## File 6: animations.conf

```txt
animations {

    enabled = yes

    bezier = myBezier,0.05,0.9,0.1,1.05

    animation = windows,1,6,myBezier

    animation = windowsOut,1,6,default,popin 80%

    animation = border,1,8,default

    animation = fade,1,6,default

    animation = workspaces,1,5,default

}
```

Animation này khá mượt nhưng vẫn nhẹ.

## File 7: keybinds.conf

```txt
#############################################################
# Launch
#############################################################

bind = ALT, Return, exec, $terminal

bind = SUPER, D, exec, $menu

bind = SUPER, E, exec, $fileManager

#############################################################
# Windows
#############################################################

bind = SUPER, Q, killactive

bind = SUPER, F, fullscreen

bind = SUPER, V, togglefloating

bind = SUPER, M, exit

bind = SUPER, R, exec, hyprctl reload

#############################################################
# Move Focus
#############################################################

bind = SUPER, left, movefocus, l

bind = SUPER, right, movefocus, r

bind = SUPER, up, movefocus, u

bind = SUPER, down, movefocus, d

#############################################################
# Mouse
#############################################################

bindm = SUPER, mouse:272, movewindow

bindm = SUPER, mouse:273, resizewindow
```

Đây là những phím tắt cơ bản. Sau này mình sẽ bổ sung thêm chuyển workspace, screenshot, lock screen...

## File 8: windowrules.conf

Để trống trước:


```txt
#############################################################
# Window Rules
#############################################################
```

Sau này ta sẽ thêm các quy tắc như mở Foot ở chế độ trong suốt hoặc đặt một số ứng dụng luôn nổi.

## File 9: autostart.conf

```txt
#############################################################
# Startup
#############################################################

exec-once = waybar

exec-once = hyprpaper

exec-once = mako

exec-once = nm-applet --indicator

exec-once = wl-paste --type text --watch cliphist store
```

## Sau khi hoàn thành

Kiểm tra cú pháp bằng:

```bash
hyprctl reload
```

Nếu Hyprland đang chạy thì cấu hình sẽ được tải lại ngay. Nếu có lỗi, Hyprland sẽ báo dòng bị sai.

