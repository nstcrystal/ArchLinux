-- Equivalent of modules/look_and_feel.conf
local colors = require("colors")

hl.config({
    general = {
        gaps_in  = 7,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border   = colors.primary,
            inactive_border = colors.outline_variant,
        },

        resize_on_border = false,

        allow_tearing = true,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 12,
        rounding_power = 4,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 15,
            render_power = 3,
            color        = "rgba(1a1a1add)",
        },

        blur = {
            enabled           = true,
            size              = 5,
            passes            = 2,
            ignore_opacity    = true,

            noise             = 0.0,
            contrast          = 1.6,
            popups            = true,

            xray              = false,
            new_optimizations = true,
        },
    },
})
