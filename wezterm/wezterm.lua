local wezterm = require 'wezterm'

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
	return 'WezTerm'
end)

return {
	adjust_window_size_when_changing_font_size = false,
	-- color_scheme = 'termnial.sexy',
	color_scheme = 'Catppuccin Mocha',
	enable_tab_bar = false,
	font_size = 15.0,
	font = wezterm.font("JetBrainsMono Nerd Font", {weight="Light", stretch="Normal", style="Normal"}),
	-- macos_window_background_blur = 40,
-- 	macos_window_background_blur = 30,
	-- window_background_image = '/home/balaji-pc/.config/wezterm/pink-clouds.jpg',
	window_background_image_hsb = {
	
		brightness = 0.20,
		hue = 1.0,
		saturation = 0.9,
	},
	-- window_background_opacity = 1.0,
	-- window_background_opacity = 0.20,
  -- window_background_opacity = 0.78,
	 window_background_opacity = 0.92,
	window_decorations = 'TITLE',
	keys = {
		{
			key = 'q',
			mods = 'CTRL',
			action = wezterm.action.ToggleFullScreen,
		},
        {
            key = 'F1',
            mods = "NONE",
            action = wezterm.action.ActivateCommandPalette,
        }
	},
	mouse_bindings = {
	  -- Ctrl-click will open the link under the mouse cursor
	  {
		event = { Up = { streak = 1, button = 'Left' } },
		mods = 'CTRL',
		action = wezterm.action.OpenLinkAtMouseCursor,
	  },
	},
}
