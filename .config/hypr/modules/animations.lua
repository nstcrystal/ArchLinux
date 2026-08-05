-- Equivalent of modules/animations.conf
hl.config({
    animations = {
        enabled = true,
    },
})

-- Bezier curves
hl.curve("overshot",   { type = "bezier", points = { { 0.05, 0.9 },   { 0.1, 1.05 } } })
hl.curve("smoothOut",  { type = "bezier", points = { { 0.36, 0 },     { 0.66, -0.56 } } })
hl.curve("smoothIn",   { type = "bezier", points = { { 0.25, 1 },     { 0.5, 1 } } })
hl.curve("fluid",      { type = "bezier", points = { { 0.4, 0 },      { 0.2, 1 } } })
hl.curve("bounce",     { type = "bezier", points = { { 0.175, 0.885 }, { 0.32, 1.275 } } })
hl.curve("1",          { type = "bezier", points = { { 0.5, 0.0 },    { 0.357, 1.0 } } })
hl.curve("rofiCurve",  { type = "bezier", points = { { 0.05, 0.9 },   { 0.1, 1.05 } } })

-- Window animations
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4.0, bezier = "default", style = "slide" })
-- hl.animation({ leaf = "windowsIn",   enabled = true, speed = 5,   bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4.0, bezier = "1",       style = "popin 80%" })
-- hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4,   bezier = "smoothIn", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4,   bezier = "fluid" })

-- Fade animations
hl.animation({ leaf = "fade",        enabled = true, speed = 4, bezier = "fluid" })
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 5, bezier = "smoothIn" })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 4, bezier = "smoothOut" })
hl.animation({ leaf = "fadeSwitch",  enabled = true, speed = 5, bezier = "fluid" })
hl.animation({ leaf = "fadeShadow",  enabled = true, speed = 6, bezier = "fluid" })
hl.animation({ leaf = "fadeDim",     enabled = true, speed = 5, bezier = "fluid" })

-- Border & decorations
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "fluid" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "fluid", style = "loop" })

-- Workspace transitions
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5,   bezier = "fluid",  style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6,   bezier = "bounce", style = "slidevert" })
hl.animation({ leaf = "workspacesIn",     enabled = true, speed = 4.5, bezier = "1",      style = "slide" })
hl.animation({ leaf = "workspacesOut",    enabled = true, speed = 4.5, bezier = "1",      style = "slide" })

-- Layer transitions
hl.animation({ leaf = "layersIn",  enabled = true, speed = 3.5, bezier = "1" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 8.0, bezier = "1" })
