https://chatgpt.com/share/6a41df8f-5420-83ec-955e-e20d2d3d73e9

```txt
cd ~/Pictures/wallpapers/ && for f in *.jpg; do mv "$f" "${f%.jpg}.png"; done
```

```txt
#!/bin/bash

dir="$HOME/.config/rofi/wallpaper"
theme='style-1'
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache/wall_thumb"

mkdir -p $CACHE_DIR

# 1. Thay đổi sang quét file .jpg để tạo thumbnail
for f in $(ls -v "$WALLPAPER_DIR"/*.jpg); do
    num=$(basename "$f" .jpg)
    thumb="$CACHE_DIR/$num.jpg"
    if [ ! -f "$thumb" ]; then
      convert "$f" -thumbnail 200x120 "$thumb"
    fi
done


CHOICE=$(
  # 2. Thay đổi sang quét file .jpg cho menu Rofi
  for f in $(ls -v "$WALLPAPER_DIR"/*.jpg); do
    num=$(basename "$f" .jpg)
    printf " \x00icon\x1f%s\n" "$CACHE_DIR/$num.jpg"
  done | rofi -dmenu \
    -p "   " \
    -theme ${dir}/${theme}.rasi \
    -show-icons \
    -i \
    -theme-str 'element-icon { size: 130px; }' \
    -format i
)

if [ -n "$CHOICE" ]; then
  # 3. Thay đổi mảng đọc file đích sang .jpg
  files=($(ls -v "$WALLPAPER_DIR"/*.jpg))
  CHOSEN_FILE="${files[$CHOICE]}"
  matugen image "$CHOSEN_FILE" --source-color-index 2
  ln -f "$CHOSEN_FILE" "$HOME/.config/hypr/hyprlock/wallpaper"
fi
```