local pallete = {
	bg = "#0f1013",
	fg = "#0f1013",
	normalFG = "#abb2bf",
	green = "#3FC56B",
	red = "#FF6480",
	purple = "#9F7EFE",
	blue = "#10B1FE",
	blueDark = "#3691FF",
	grey3 = "#2d333e",
	grey5 = "#333a48",
	grey7 = "#384252",
	grey20 = "#4a5a73",
}

local t = pallete

return {
	normal = {
		a = { bg = t.blue, fg = t.bg },
		b = { bg = t.grey7, fg = t.fg },
		c = { bg = t.grey3, fg = t.fg },
	},
	insert = {
		a = { bg = t.blueDark, fg = t.bg },
		b = { bg = t.grey7, fg = t.blueDark },
		c = { bg = t.grey3, fg = t.fg },
	},
	visual = {
		a = { bg = t.purple, fg = t.bg },
		b = { bg = t.grey7, fg = t.purple },
		c = { bg = t.grey3, fg = t.fg },
	},
	replace = {
		a = { bg = t.red, fg = t.bg },
		b = { bg = t.grey7, fg = t.red },
		c = { bg = t.grey3, fg = t.fg },
	},
	command = {
		a = { bg = t.green, fg = t.bg },
		b = { bg = t.grey7, fg = t.green },
		c = { bg = t.grey3, fg = t.fg },
	},
	inactive = {
		a = { bg = t.grey20, fg = t.grey3 },
		b = { bg = t.grey5, fg = t.grey20 },
		c = { bg = t.grey5, fg = t.grey20 },
	},
}
