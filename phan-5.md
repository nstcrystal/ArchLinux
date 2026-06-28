# PHẦN 5

## Foot

### File

```bash
~/.config/foot/foot.ini
```

### Nội dung

```txt
[main]

font=JetBrainsMono Nerd Font:size=12

pad=10x10

dpi-aware=yes

term=xterm-256color

[scrollback]

lines=10000

[cursor]

style=beam

blink=yes

[colors]

alpha=0.92

foreground=c0caf5
background=1a1b26

regular0=15161e
regular1=f7768e
regular2=9ece6a
regular3=e0af68
regular4=7aa2f7
regular5=bb9af7
regular6=7dcfff
regular7=a9b1d6

bright0=414868
bright1=f7768e
bright2=9ece6a
bright3=e0af68
bright4=7aa2f7
bright5=bb9af7
bright6=7dcfff
bright7=c0caf5
```

Đây là bảng màu Tokyo Night. Bạn sẽ thấy:

✓ nền hơi trong

✓ màu đẹp

✓ font đẹp

## Foot

Nếu chưa có foot

Trong `env.conf` thêm:

```txt
$terminal = foot
```

Sau đó trong `keybinds.conf`

```txt
bind = ALT, Return, exec, $terminal
```

## Rofi

Đây là launcher, nhưng mình không thích giao diện mặc định. Mình muốn nó như thế này:

- Bo góc
- Blur
- Tokyo Night
- Shadow
- Animation
- Có icon

Thế nên phần này mình sẽ tự thiết kế một theme.

### Tạo

```bash
~/.config/rofi/config.rasi
```

và

```bash
~/.config/rofi/tokyo-night.rasi
```

## Wallpaper

Thay vì

```bash
~/Wallpapers
```

mình sẽ dùng

```txt
~/Pictures/Wallpapers
```

đúng chuẩn XDG.


## Hyprpaper

```bash
~/.config/hyprpaper/hyprpaper.conf
```

Ví dụ

```txt
preload = ~/Pictures/Wallpapers/tokyo-night.png

wallpaper = ,~/Pictures/Wallpapers/tokyo-night.png
```

Sau này chỉ cần

```bash
cp wallpaper.png ~/Pictures/Wallpapers
```

là xong.




