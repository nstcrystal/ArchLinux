# ArchLinux + HyprLand — Cấu hình và hướng dẫn sử dụng

Bộ cấu hình này chứa các thiết lập cá nhân cho Hyprland (Wayland) và một số tiện ích (rofi, kitty, waybar, v.v.).

---

## Tổng quan nhanh

- Cấu hình Hyprland chính: `.config/hypr/hyprland.lua` — file Lua này nạp các module: `modules/monitors`, `modules/my_programs`, `modules/auto_start`, `modules/env`, `modules/look_and_feel`, `modules/animations`, `modules/input`, `modules/key_binds`, `modules/windows_and_workspaces`.
- Bảng màu: `.config/hypr/colors.lua`.
- Khóa màn hình / idle: `.config/hypr/hypridle.conf` gọi các script:
  - `.config/hypr/lock_anim.sh` — bật animation rồi chạy `hyprlock`.
  - `.config/hypr/unlock_anim.sh` — animation khi mở khóa.

---

## Yêu cầu trước khi cài

- Hệ thống Arch Linux đã cài và cập nhật.
- Driver GPU phù hợp:
  - Intel / AMD: `mesa` và driver vga tương ứng (ví dụ `xf86-video-intel`, `xf86-video-amdgpu`) — nếu dùng X11 fallback; cho Wayland thường chỉ cần `mesa` + driver kernel.
  - NVIDIA: dùng driver `nvidia` (phiên bản tương thích) và cài `nvidia-utils`. Lưu ý: NVIDIA + Wayland có cách cấu hình đặc thù.
- Session manager / login:
  - Bạn có thể dùng display manager (SDDM, GDM, LightDM) và đăng nhập vào session Hyprland, hoặc bắt đầu Hyprland trực tiếp từ TTY.
- Hệ thống có `elogind` / `systemd-logind` hoạt động cho seat/session.

---

## Packages & Dependencies (gợi ý)

Một số package thường dùng với cấu hình này (có thể ở repo chính thức hoặc AUR). Thay đổi theo nhu cầu cá nhân.

Ví dụ cài qua pacman (repo chính thức):

```bash
sudo pacman -Syu
sudo pacman -S --needed hyprland wayland wl-clipboard xdg-desktop-portal xdg-desktop-portal-hyprland wlroots hyprlock waybar rofi kitty neovim fish btop pavucontrol grim slurp
```

Nếu một package không có trong repo chính thức, dùng AUR helper (ví dụ paru / yay):

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

---

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

4. Kiểm tra các file config hyprlock:

Thư mục `~/.config/hypr/hyprlock/` (nếu tồn tại) chứa `hyprlock.conf` — kiểm tra đường dẫn trong `lock_anim.sh` và `hypridle.conf` để chắc trùng khớp.

---

## Khởi động Hyprland

- Bằng display manager: chọn session Hyprland khi đăng nhập.
- Từ TTY (không dùng DM): bạn có thể chạy Hyprland trực tiếp. Nếu cần khởi tạo session DBus:

```bash
dbus-run-session Hyprland
# hoặc đơn giản:
Hyprland
```

(tùy hệ thống, bạn có thể cần `dbus-run-session` để portal hoạt động đúng)

---

## Tính năng chính và cách dùng theo cấu hình repo

- Reload cấu hình Hyprland:

```bash
hyprctl reload
```

(hoặc `hyprctl reload` / `hyprctl general reload` tuỳ phiên bản — kiểm tra `hyprctl help`)

- Lock / idle:
  - Cấu hình `.config/hypr/hypridle.conf` sẽ gọi `~/.config/hypr/lock_anim.sh` khi timeout. `lock_anim.sh` bật animation bằng `hyprctl` rồi gọi `hyprlock -c <config>`.
  - Mở khóa sẽ chạy `unlock_anim.sh` (bật animation khi unlock).

- Autostart / chương trình mặc định:
  - Kiểm tra `modules/my_programs.lua` và `modules/auto_start` (được nạp trong `hyprland.lua`) để thêm/bớt ứng dụng autostart.
  - Thêm ứng dụng vào mục autostart sẽ khiến Hyprland tự chạy khi khởi session.

- Keybinds / input:
  - Các phím nóng và thiết lập bàn phím nằm trong `modules/input` và `modules/key_binds`. Thực hiện chỉnh sửa tại đó rồi reload config.

- Màu sắc / giao diện:
  - Chỉnh `colors.lua` để thay đổi bảng màu toàn bộ giao diện (các module khác require() file này).

---

## Tuỳ chỉnh nhanh

- Thay đổi màu: edit `~/.config/hypr/colors.lua`.
- Thêm ứng dụng khởi động: edit `modules/my_programs.lua` (hoặc file tương ứng trong `.config/hypr/modules/`).
- Thay đổi timeout khoá màn hình: edit `.config/hypr/hypridle.conf`.
- Muốn sửa keybind: edit `modules/key_binds`.

Sau khi sửa, chạy `hyprctl reload` để áp dụng (hoặc đăng xuất/đăng nhập lại nếu cần).

---

## Khắc phục sự cố

- Nếu Hyprland không khởi động: kiểm tra lỗi khi chạy từ TTY (xem output) — thiếu driver GPU, thiếu thư viện wlroots, hoặc quyền seat/login có thể gây lỗi.
- Lỗi screenshot/portal: cài `xdg-desktop-portal` và `xdg-desktop-portal-hyprland`.
- Nếu khóa màn hình không chạy: kiểm tra đường dẫn và quyền thực thi của `lock_anim.sh` và file `hyprlock.conf`.
- Kiểm tra logs: xem journalctl (ví dụ `journalctl -b -xe`), và chạy `Hyprland` từ TTY để đọc lỗi trực tiếp.

---

## Ghi chú

Tài liệu tham khảo hữu ích:
- Hyprland docs: https://wiki.hypr.land/
- Arch Wiki (Wayland, GPU drivers, AUR): https://wiki.archlinux.org/