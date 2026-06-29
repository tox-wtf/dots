-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@300",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "alacritty"
local fileManager = "dolphin"
local menu        = "~/.local/bin/desktop-launch.sh"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
-- hl.on("hyprland.start", function ()
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function ()
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("alacritty --daemon")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img ~/pics/wp/flat-samurai-peach.png")
end)

hl.on("hyprland.shutdown", function ()
    hl.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rosepine")

hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("WAYLAND_DISPLAY", "wayland-0")
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

hl.env("AWWW_TRANSITION", "any")
hl.env("AWWW_TRANSITION_DURATION", "1")
hl.env("AWWW_TRANSITION_FPS", "240")

hl.env("RISHOT_SAVEDIR", os.getenv("XDG_PICTURES_DIR") .. "/ss")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 1,
        gaps_out = 2,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(f2a978ff)", "rgba(c995dbff)"}, angle = 45 },
            inactive_border = "rgba(00000000)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 0,
        rounding_power = 0,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = false,
            size      = 14,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutExpo",    { type = "bezier", points = { {0.16, 1},    {0.30, 1}    } })
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutExpo" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 2.4,  bezier = "easeOutExpo" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 2.4,  bezier = "easeOutExpo", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.2,  bezier = "easeOutExpo", style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutExpo" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutExpo", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",      style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 2.4,  bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 2.4,  bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 2.4,  bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:swapescape",
        kb_rules   = "",

        repeat_delay = 250,
        repeat_rate = 150,

        follow_mouse = 1,
        accel_profile = "flat",
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
            disable_while_typing = true,
            tap_to_click = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "turtle-beach-burt-ii-pro-donlge-1",
    sensitivity = -0.15,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Toggle touchpad
hl.bind(mainMod .. " + ALT + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-touchpad.sh"))

-- hl.bind(mainMod .. " + CTRL + SHIFT + E", hl.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- Application binds
hl.bind(mainMod .. " + W",          hl.dsp.exec_cmd("floorp -P Main"))
hl.bind(mainMod .. " + SHIFT + W",  hl.dsp.exec_cmd("floorp -P School"))
hl.bind(mainMod .. " + Escape",     hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + V",          hl.dsp.exec_cmd("vesktop"))

-- Tuun
hl.bind(mainMod .. " + T",          hl.dsp.exec_cmd("alacritty msg create-window --class tuun --hold -e tuun"))
hl.bind(mainMod .. " + U",          hl.dsp.exec_cmd("quu"))
hl.bind(mainMod .. " + CONTROL + U", hl.dsp.exec_cmd("SORT=shuf quu"))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("~/.config/tuun/mpv.sh j"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("~/.config/tuun/mpv.sh k"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.config/tuun/mpv.sh l"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("~/.config/tuun/mpv.sh o"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("~/.config/tuun/mpv.sh m"))
hl.bind(mainMod .. " + Comma", hl.dsp.exec_cmd("~/.config/tuun/mpv.sh b"))
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd("~/.config/tuun/mpv.sh f"))

-- -- GSR
-- hl.bind(mainMod .. " + F11", hl.dsp.exec_cmd("~/.local/bin/rec start"))
-- hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("~/.local/bin/rec stop"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + grave", hl.dsp.focus({ workspace = 1}))
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = 1, follow = false}))
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i + 1}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i + 1, follow = false }))
end
--
-- -- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Screenshots
hl.bind(mainMod .. " + S",          hl.dsp.exec_cmd("rishot region"))
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.exec_cmd("rishot monitor"))
-- hl.bind(mainMod .. " + S",          hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh sele"))
-- hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh full"))


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Fix borders appearing in screenshots
hl.layer_rule {
    name = 'no-anim-for-selection',
    match = { namespace = 'selection' },
    no_anim = true,
}

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "tuun-mpv",
    match = { class = "mpv", title="tuun-mpv" },

    move  = { "1400", "150" },
    float = true,
})

hl.window_rule({
    name  = "tuun-alacritty",
    match = { class = "tuun", title="Alacritty" },

    move  = { "120", "80" },
    size  = { "727", "188" },
    float = true,
})

hl.window_rule({
    name  = "fzm",
    match = { class = "fzm", title = "fzm" },

    float = true,
    stay_focused = true,
    dim_around = true,
    pin = true,
})

hl.window_rule({
    name  = "balatro",
    match = { class = "steam_app_2379780", title = "Balatro" },

    render_unfocused = true,
})
