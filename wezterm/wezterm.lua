local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Key Maps
config.leader = {
	key = " ",
	mods = "CTRL",
	timeout_milliseconds = 3000,
}

-- Change default shell
config.default_prog = { "pwsh.exe", "-NoLogo" }

config.keys = {
	-- pane creation and deletion
	{
		key = "'",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = ";",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "q",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	-- Pane navigation
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},

	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }),
	},

	-- Pane Resizing
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 3 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 3 }),
	},

	-- Tab creation and deletion
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},

	-- Tab Navigation
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelativeNoWrap(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelativeNoWrap(-1),
	},
	-- reload config
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ReloadConfiguration,
	},
}

config.color_scheme = "Atom One Dark"

config.window_background_image = "C:/Users/karma/Wallpapers/night_sky.png"
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono", { weight = "Bold" })

-- Plugins
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		icons_enabled = true,
		theme = "Atom",
		tabs_enabled = true,
		theme_overrides = {},
		section_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
		component_separators = {
			left = wezterm.nerdfonts.pl_left_soft_divider,
			right = wezterm.nerdfonts.pl_right_soft_divier,
		},
		tab_separators = {
			left = wezterm.nerdfonts.pl_left_hard_divider,
			right = wezterm.nerdfonts.pl_right_hard_divider,
		},
	},
	sections = {
		tabline_a = { "mode" },
		tabline_b = { "workspace" },
		tabline_c = { " " },
		tab_active = {
			"index",
			{ "parent", padding = 0 },
			"/",
			{ "cwd", padding = { left = 0, right = 1 } },
			{ "zoomed", padding = 0 },
		},
		tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
		tabline_x = { "ram", "cpu" },
		tabline_y = { "datetime", "battery" },
		tabline_z = { "domain" },
	},
	extensions = {},
})

-- Return configuration to wezterm
return config
