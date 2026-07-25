
hl.monitor({
  output = "DP-1",
  mode = "preferred",
  position = "0x0",
  scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "1920x0",
	scale = "1.5",
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

local terminal = "alacritty"
local fileManager = "thunar"
local menu = "fuzzel"
local lock = "hyprlock"
local browser = "zen"
local mainMod = "SUPER"

hl.on("hyprland.start", function ()
   hl.exec_cmd(terminal)
   hl.exec_cmd("nm-applet")
   hl.exec_cmd("waybar & hyprpaper")
end)

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
            -- tap-to-click = true,
        },
    },

    general = {
        gaps_in = 4,
        gaps_out = 8,

        border_size = 2,

        col = {
            active_border   = "rgb(8aadf4)",
            inactive_border = "rgb(494d64)",
        },

        resize_on_border = true,

        layout = "dwindle",
    },

    decoration = {
        rounding = 6,

        blur = {
            enabled = true,
            size = 5,
            passes = 2,        }
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(lock))

hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen("fullscreen", toggle))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(cliphist list | fuzzel --dmenu | cliphist decode | wl-copy))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(cliphist wipe))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(makoctl dismiss))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(makoctl dismiss --all))

hl.bind("SHIFT + Print", hl.dsp.exec_cmd(hyprshot -m output))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(hyprshot -m window))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(hyprshot -m region --clipboard-only))
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd(hyprshot -m output --clipboard-only))
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd(hyprshot -m window --clipboard-only))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key,            hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key,    hl.dsp.window.move({ workspace = i }))
end

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + j",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k",  hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + arrow keys
hl.bind(mainMod .. " + SHIFT + h",      hl.dsp.window.move({ direction = "left" }))
-- hl.bind(mainMod .. " + SHIFT + l",   hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + j",      hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + k",      hl.dsp.window.move({ direction = "down" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + I",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

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

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

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
