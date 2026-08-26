# ArchLinux + HyprLand — Cấu hình và hướng dẫn sử dụng

Bộ cấu hình này chứa các thiết lập cá nhân cho Hyprland (Wayland) và một số tiện ích (rofi, kitty, waybar, v.v.).

## Tổng quan nhanh

Cấu trúc thư mục cấu hình Hyprland

```text
.config/
└── hypr/
    ├── hyprland.lua                # Cấu hình Hyprland chính (nạp các module bên dưới)
    ├── colors.lua                  # Cấu hình bảng màu
    ├── hypridle.conf               # Cấu hình khóa màn hình và trạng thái idle
    ├── lock_anim.sh                # Script: Bật animation rồi chạy hyprlock
    ├── unlock_anim.sh              # Script: Chạy animation khi mở khóa
    └── modules/                    # Thư mục chứa các module cho hyprland.lua
        ├── monitors.lua            # Cấu hình màn hình (độ phân giải, tần số quét...)
        ├── my_programs.lua         # Định nghĩa các chương trình mặc định
        ├── auto_start.lua          # Các ứng dụng khởi chạy cùng hệ thống
        ├── env.lua                 # Các biến môi trường
        ├── look_and_feel.lua       # Cấu hình giao diện (viền, khoảng cách, trang trí)
        ├── animations.lua          # Cấu hình hiệu ứng chuyển động
        ├── input.lua               # Cấu hình thiết bị đầu vào (chuột, bàn phím, touchpad)
        ├── key_binds.lua           # Phím tắt (shortcuts)
        └── windows_and_workspaces.lua # Các quy tắc cho cửa sổ và không gian làm việc  
```

## Packages & Dependencies

Một số package thường dùng với cấu hình này (có thể ở repo chính thức hoặc AUR). Thay đổi theo nhu cầu cá nhân.

Ví dụ cài qua pacman (repo chính thức):

```bash
sudo pacman -Syu
sudo pacman -S --needed hyprland wayland wl-clipboard xdg-desktop-portal xdg-desktop-portal-hyprland wlroots hyprlock waybar rofi kitty neovim fish btop pavucontrol grim slurp
```

Nếu một package không có trong repo chính thức, dùng AUR helper (yay / paru):

```bash
paru -S <package-aurname>
```

Gợi ý packages để cân nhắc:
- hyprland, hyprlock, hyprctl (thường đi kèm với hyprland)
- xdg-desktop-portal-hyprland (cần cho portal / screenshot / file dialogs trên Hyprland)
- waybar hoặc waybar-hyprland (panel/status)
- rofi (application launcher)
- kitty (terminal)
- waypaper (wallpaper utility), swaync / swaybg 等 (tùy cấu hình)
- grim + slurp (chụp màn hình)
- wl-clipboard (clipboard dưới Wayland)
- pavucontrol / pamixer (audio)
- fish (shell), neovim (editor), btop, cava (visualizer)
- Một AUR package có thể được yêu cầu cho `hypridle` hoặc các fork/hỗ trợ riêng (nếu bạn dùng hypridle từ repo riêng)

Lưu ý: tên package tùy thời điểm; kiểm tra Arch repositories và AUR.

## Cài đặt cấu hình từ repo này

1. Clone repo:

```bash
git clone https://github.com/nstcrystal/ArchLinux.git
cd ArchLinux
```

2. Sao chép cấu hình vào thư mục người dùng:

```bash
mkdir -p ~/.config
cp -r .config/* ~/.config/
```

3. Đặt quyền thực thi cho script:

```bash
chmod +x ~/.config/hypr/lock_anim.sh
chmod +x ~/.config/hypr/unlock_anim.sh
# nếu có script khác cần chạy, đặt `chmod +x` cho chúng
```

## Khởi động Hyprland

- Bằng display manager: chọn session Hyprland khi đăng nhập.
- Từ TTY (không dùng DM): bạn có thể chạy start-hyprland trực tiếp

```bash
start-hyprland
```

(tùy hệ thống, bạn có thể cần `dbus-run-session` để portal hoạt động đúng)

## Ghi chú

Tài liệu tham khảo hữu ích:
- Hyprland docs: https://wiki.hypr.land/
- Arch Wiki (Wayland, GPU drivers, AUR): https://wiki.archlinux.org/