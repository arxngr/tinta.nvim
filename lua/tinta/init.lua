local lush = require("lush")
local M = {}

local isGui = vim.fn.has("gui_running") == 1

local defaultConfig = {
	style = "dark",
	transparent = false,
	terminal = isGui,
	guicursor = true,
	rainbow_headings = false,
}

M.config = defaultConfig

function M.setup(options)
	M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})

	-- Set cursor color
	if M.config.guicursor then
		vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
	end
end

function M.load()
	local theme = require("hightlights.tinta")
	vim.g.colors_name = "tinta"
	package.loaded["hightlights.tinta"] = nil

	-- transparent
	if M.config.transparent == true and not isGui then
		theme = lush.extends({ theme }).with(function()
			return {
				Normal({ theme.Normal, bg = "NONE" }), -- normal text
				NormalSB({ bg = "NONE" }),
				BufferlineFill({ bg = "NONE" }),
				TroubleNormal({ bg = "NONE" }),
				NvimTreeNormal({ bg = "NONE" }),
				NvimTreeNormalNC({ bg = "NONE" }),
				BufferInactive({ theme.BufferInactive, bg = "NONE" }),
				BufferVisible({ theme.BufferCurrent }),
			}
		end)
	end

	-- rainbow headings
	if M.config.rainbow_headings == true then
		theme = lush.extends({ theme }).with(function(injected_functions)
			local sym = injected_functions.sym
			return {
				sym("@markup.heading.1")({ theme.RainbowRed }),
				sym("@markup.heading.2")({ theme.RainbowYellow }),
				sym("@markup.heading.3")({ theme.RainbowBlue }),
				sym("@markup.heading.4")({ theme.RainbowOrange }),
				sym("@markup.heading.5")({ theme.RainbowGreen }),
				sym("@markup.heading.6")({ theme.RainbowViolet }),
				markdownH1({ theme.RainbowRed }),
				markdownH2({ theme.RainbowYellow }),
				markdownH3({ theme.RainbowBlue }),
				markdownH4({ theme.RainbowOrange }),
				markdownH5({ theme.RainbowGreen }),
				markdownH6({ theme.RainbowViolet }),
			}
		end)
	end

	-- bufferline
	local bufferlineInstalled = pcall(require, "bufferline")
	if bufferlineInstalled then
		theme = lush.extends({ theme }).with(function()
			return {
				TabLineSel({ bg = theme.Statement.fg }), -- tab pages line, active tab page label
			}
		end)
	end

	lush(theme)
end

return M
