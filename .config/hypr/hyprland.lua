-- Main Hyprland Lua config (equivalent of hyprland.conf)
-- Load all module files. Each require() runs in its own scope, so an error in
-- one module does not stop execution of the others.

require("modules.monitors")
require("modules.my_programs")
require("modules.auto_start")
require("modules.env")
require("modules.look_and_feel")
require("modules.animations")
require("modules.input")
require("modules.key_binds")
require("modules.windows_and_workspaces")

-- -----------------
-- ### PERMISSIONS ###
-- -----------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
