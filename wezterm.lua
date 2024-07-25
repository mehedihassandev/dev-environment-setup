local wezterm = require 'wezterm'
local act = wezterm.action


local config = {}

-- config.leader = { key="space", mods="CTRL" }

-- Color scheme
-- config.color_scheme = 'Dracula (Official)'

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- Settings
config.font_size = 13.0
config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}
-- Font settings
config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false })

-- Key bindings
config.keys = {}

-- Mouse bindings
config.mouse_bindings = {}

-- Window Frame
config.window_frame = {
  inactive_titlebar_bg = 'transparent',
  active_titlebar_bg = 'transparent',
  inactive_titlebar_fg = 'transparent',
  active_titlebar_fg = 'transparent',
  inactive_titlebar_border_bottom = 'transparent',
  active_titlebar_border_bottom = 'transparent',
  button_fg = 'transparent',
  button_bg = 'transparent',
  button_hover_fg = 'transparent',
  button_hover_bg = 'transparent',
}

-- config.window_padding = {
--   left = 0,
--   right = 0,
--   top = 0,
--   bottom = 0,
-- }




return config