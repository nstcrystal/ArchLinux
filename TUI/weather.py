import requests
from rich.console import Console
from rich.panel import Panel
from rich.padding import Padding
from rich.table import Table

import json
import time
from pathlib import Path


# Tọa độ địa lý của Thành phố Huế
LATITUDE = 16.4637
LONGITUDE = 107.5909


CACHE_FILE = Path("/tmp/hue_weather_cache.json")
CACHE_DURATION = 900  # 15 phút (900 giây)


def get_hue_weather():
    # 1. Kiểm tra xem cache có còn hiệu lực không
    if CACHE_FILE.exists():
        file_age = time.time() - CACHE_FILE.stat().st_mtime
        if file_age < CACHE_DURATION:
            with open(CACHE_FILE, "r") as f:
                return json.load(f)

    # 2. Nếu hết hạn hoặc chưa có cache thì mới gọi API
    url = f"https://api.open-meteo.com/v1/forecast?latitude={LATITUDE}&longitude={LONGITUDE}&current_weather=true"
    try:
        response = requests.get(url, timeout=3)
        if response.status_code == 200:
            data = response.json()
            # Ghi dữ liệu mới vào cache
            with open(CACHE_FILE, "w") as f:
                json.dump(data, f)
            return data
    except requests.exceptions.RequestException:
        pass

    # Nếu lỗi mạng nhưng có cache cũ, dùng tạm cache cũ luôn
    if CACHE_FILE.exists():
        with open(CACHE_FILE, "r") as f:
            return json.load(f)

    return None


# def get_hue_weather():
#     # Gọi Open-Meteo API để lấy dữ liệu thời tiết thực tế
#     url = f"https://api.open-meteo.com/v1/forecast?latitude={LATITUDE}&longitude={LONGITUDE}&current_weather=true&hourly=relativehumidity_2m"
#     response = requests.get(url)

#     if response.status_code == 200:
#         return response.json()
#     return None

# def get_hue_weather():
#     # Chỉ gọi đúng biến current_weather, bỏ các tham số thừa
#     url = f"https://api.open-meteo.com/v1/forecast?latitude={LATITUDE}&longitude={LONGITUDE}&current_weather=true"

#     try:
#         # Thêm timeout=3 (chỉ chờ tối đa 3 giây)
#         response = requests.get(url, timeout=3)
#         if response.status_code == 200:
#             return response.json()
#     except requests.exceptions.RequestException:
#         return None
#     return None


def main():
    console = Console()
    data = get_hue_weather()

    if not data:
        console.print(
            "[bold red]Không thể kết nối đến máy chủ thời tiết![/bold red]"
        )
        return

    current = data["current_weather"]
    temp = current["temperature"]
    windspeed = current["windspeed"]
    is_day = "Ban ngày ☀️" if current["is_day"] == 1 else "Ban đêm 🌙"

    # Tạo bảng thông số
    table = Table(show_header=False, box=None, padding=(0, 2))
    table.add_column("Chỉ số", style="bold cyan")
    table.add_column("Giá trị", style="yellow")

    table.add_row("Nhiệt độ:", f"{temp} °C")
    table.add_row("Tốc độ gió:", f"{windspeed} km/h")
    table.add_row("Thời gian:", is_day)

    # Đóng gói bảng vào Panel giao diện TUI
    panel = Panel(
        table,
        title="[bold green]📍 THỜI TIẾT THÀNH PHỐ HUẾ[/bold green]",
        subtitle="[dim]Cập nhật từ Open-Meteo[/dim]",
        border_style="magenta",
        expand=False,
    )

    # Bọc panel vào Padding: (top, right, bottom, left)
    # Lề trái (left) = 30 khoảng trắng
    padded_panel = Padding(panel, (1, 0, 0, 31))

    console.print(padded_panel)


if __name__ == "__main__":
    main()