-- Equivalent of modules/windows_and_workspaces.conf
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    match = { class = "com.gabm.satty" },
    float = true,
    size  = { 500, 500 },
})

-- Layer rules
hl.layer_rule({
    match        = { namespace = "waybar" },
    blur         = true,
    ignore_alpha = 0.1,
    no_anim      = true,
})

hl.layer_rule({
    match        = { namespace = "swaync-control-center" },
    blur         = true,
    ignore_alpha = 0.1,
    animation    = "slide right",
})

hl.layer_rule({
    match        = { namespace = "swaync-notification-window" },
    blur         = true,
    ignore_alpha = 0.1,
    animation    = "slide right",
})

hl.layer_rule({
    match     = { namespace = "logout_dialog" },
    animation = "fade",
    blur      = true,
})

hl.layer_rule({
    match        = { namespace = "rofi" },
    animation    = "slide",
    blur         = true,
    ignore_alpha = 0.3,
})

hl.layer_rule({
    match        = { namespace = "swayosd" },
    blur         = true,
    ignore_alpha = 0.1,
})

-- Picture-in-picture window rule (commented out in the original config)
-- hl.window_rule({
--     name  = "pip",
--     match = { title = "^(Picture-in-Picture)$|^(\"\")$" },
--     float = true,
--     pin   = true,
--     opacity = "1.0 override",
-- })

-- Transparency rules for common apps
hl.window_rule({
    name    = "vscode-transparency",
    match   = { class = "^(code)$|^(code-url-handler)$" },
    opacity = "0.9 override 0.9 override",
})

hl.window_rule({
    name    = "spotify-transparency",
    match   = { class = "^(Spotify)$" },
    opacity = "0.9 override 0.9 override",
})

hl.window_rule({
    name    = "steam-transparency",
    match   = { class = "^(steam)$" },
    opacity = "0.9 override 0.9 override",
})

hl.window_rule({
    name    = "discord-transparency",
    match   = { class = "^(discord)$" },
    opacity = "0.9 override 0.9 override",
})

hl.window_rule({
    name    = "chrome-transparency",
    match   = { class = "^(google-chrome)$" },
    opacity = "0.92 override 0.92 override",
})
