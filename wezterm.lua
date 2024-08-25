local wezterm = require 'wezterm'
local act = wezterm.action


local config = {
  -- Settings
  automatically_reload_config = true,
  adjust_window_size_when_changing_font_size = false,
  window_background_opacity = 0.85,
  enable_tab_bar = true,
  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  scrollback_lines = 3000,
  default_workspace = "main",
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5
  },
  window_padding = {
    left = 3,
    right = 3,
    top = 10,
    bottom = 15,
  },

  background = {
    {
      source = {
        File = "/home/" .. os.getenv("USER") .. "/Pictures/wezteram.png",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.5,
      },
      attachment = { Parallax = 0.3 },
      width = "100%",
      height = "100%",
    },
    {
      source = {
        Color = "#282c35",
      },
      width = "100%",
      height = "100%",
      opacity = 0.65,
    },
  },


  -- Font settings
  font = wezterm.font('Cascadia Code', { weight = 'Bold', italic = false }),
  font_size = 13.0,

  -- Color scheme
  color_scheme = 'Dracula (Official)',
  colors = {
    foreground = "#CBE0F0",
    background = "#011423",
    cursor_bg = "#47FF9C",
    cursor_bg = "#ffffff",
    cursor_border = "#47FF9C",
    cursor_fg = "#011423",
    selection_bg = "#033259",
    selection_fg = "#CBE0F0",
    ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
    brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
  },
  keys = {},
  mouse_bindings = {},
  -- window_frame = {
  --   inactive_titlebar_bg = 'transparent',
  --   active_titlebar_bg = 'transparent',
  --   inactive_titlebar_fg = 'transparent',
  --   active_titlebar_fg = 'transparent',
  --   inactive_titlebar_border_bottom = 'transparent',
  --   active_titlebar_border_bottom = 'transparent',
  --   button_fg = 'transparent',
  --   button_bg = 'transparent',
  --   button_hover_fg = 'transparent',
  --   button_hover_bg = 'transparent',
  -- },

  -- from: https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
      format = "$1",
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },

}

-- config.leader = { key="space", mods="CTRL" }




return config