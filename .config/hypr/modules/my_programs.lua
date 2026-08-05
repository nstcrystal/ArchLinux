-- Equivalent of modules/my_programs.conf
-- Programs are returned as a table so other modules (e.g. key_binds.lua) can use them.

local programs = {
    terminal    = "kitty",
    fileManager = "thunar",
    menu        = "killall -9 rofi || ~/.config/rofi/launcher.sh",
    browser     = "google-chrome-stable",
    color       = "hyprpicker",
}

return programs
