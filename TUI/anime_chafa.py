import subprocess
import shutil
import requests

HEADERS = {
    "User-Agent": "NSTCrystal-WaifuViewer/1.0 (https://github.com/nstcrystal)"
}


def get_random_waifu():
    response = requests.get(
        "https://nekos.best/api/v2/waifu",
        headers=HEADERS,
        timeout=10,
    )
    response.raise_for_status()

    return response.json()["results"][0]["url"]


def display_image_chafa(image_url):
    response = requests.get(
        image_url,
        headers=HEADERS,
        timeout=10,
    )
    response.raise_for_status()

    cols, rows = shutil.get_terminal_size()

    subprocess.run(
        [
            "chafa",
            "--fit-width",
            "--colors",
            "full",
            "--symbols",
            "block",
            "--size",
            f"{cols // 2}x{rows // 2}",
            "-",
        ],
        input=response.content,
        check=True,
    )


if __name__ == "__main__":
    display_image_chafa(get_random_waifu())