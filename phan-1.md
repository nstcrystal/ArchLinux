# Bước 1: Cập nhật hệ thống

## Bước 1: Cập nhật hệ thống

Đầu tiên hãy cập nhật Arch Linux:


```txt
sudo pacman -Syu
```

Khởi động lại nếu kernel được cập nhật.

## Bước 2: Cài các package cần thiết

Chạy lệnh sau:

```txt
sudo pacman -S \
foot \
waybar \
rofi-wayland \
thunar \
hyprpaper \
hyprlock \
hypridle \
mako \
brightnessctl \
network-manager-applet \
pavucontrol \
pipewire \
pipewire-pulse \
wireplumber \
grim \
slurp \
wl-clipboard \
cliphist \
xdg-desktop-portal-hyprland \
xdg-desktop-portal \
ttf-jetbrains-mono-nerd \
noto-fonts \
noto-fonts-cjk \
noto-fonts-emoji \
papirus-icon-theme \
polkit-kde-agent \
fastfetch \
playerctl \
btop
```

Mỗi package để làm gì?


| Package                     | Công dụng           |
| --------------------------- | ------------------- |
| foot                        | Terminal            |
| waybar                      | Thanh trạng thái    |
| rofi-wayland                | Launcher ứng dụng   |
| thunar                      | Trình quản lý file  |
| hyprpaper                   | Wallpaper           |
| hyprlock                    | Khóa màn hình       |
| hypridle                    | Tự khóa màn hình    |
| mako                        | Thông báo           |
| brightnessctl               | Điều chỉnh độ sáng  |
| network-manager-applet      | Quản lý WiFi        |
| pavucontrol                 | Quản lý âm thanh    |
| pipewire                    | Âm thanh            |
| grim                        | Chụp màn hình       |
| slurp                       | Chọn vùng chụp      |
| wl-clipboard                | Clipboard Wayland   |
| cliphist                    | Lịch sử clipboard   |
| xdg-desktop-portal-hyprland | Screen sharing      |
| JetBrains Nerd Font         | Font đẹp cho Waybar |
| Papirus                     | Icon                |
| playerctl                   | Điều khiển nhạc     |
| btop                        | Theo dõi tài nguyên |

## Bước 3: Kiểm tra PipeWire

Chạy:

```txt
systemctl --user status pipewire
```

Nếu thấy:

```txt
Active: active (running)
```

là ổn

## Bước 4: Kiểm tra NetworkManager

```txt
systemctl status NetworkManager
```

Nếu chưa chạy:

```txt
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
```

## Bước 5: Tạo cấu trúc thư mục

```txt
mkdir -p ~/.config/{hypr,waybar,foot,rofi,hyprpaper,mako,wlogout}
```

Kiểm tra:

```txt
tree ~/.config
```

Nếu chưa có `tree`:

```txt
sudo pacman -S tree
```

## Bước 6: Sao lưu cấu hình cũ

Đây là bước rất quan trọng.

```txt
mkdir -p ~/.config/backup
```

Sau đó:

```txt
mv ~/.config/hypr ~/.config/backup/hypr-old
```

Đừng xóa, chỉ đổi chỗ để có thể quay lại nếu cần.

Sau đó tạo lại:

```txt
mkdir ~/.config/hypr
```

## Bước 7: Kiểm tra các package

Chạy:

```txt
foot --version
```

```txt
waybar --version
```

```txt
rofi -v
```

```txt
hyprpaper --version
```

```txt
hyprlock --version
```

Nếu tất cả đều hiển thị phiên bản là ổn.

## Bước 8: Chuẩn bị Wallpaper

Tạo thư mục:

```txt
mkdir -p ~/Pictures/Wallpapers
```

## Sau khi hoàn thành

✓ Hyprland 0.55.4

✓ Foot

✓ Waybar

✓ Rofi

✓ Hyprpaper

✓ Hyprlock

✓ Mako

✓ PipeWire

✓ Screenshot

✓ Clipboard

✓ Nerd Font

✓ Papirus Icons