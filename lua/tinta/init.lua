local lush = require("lush")
local hsl = lush.hsl
local M = {}

local isGui = vim.fn.has("gui_running") == 1

local defaultConfig = {
	transparent = false,
	terminal = isGui,
	guicursor = false,
	palette = "tinta",
	bg_color = "",
	rainbow_headings = false,
}

M.config = defaultConfig

function M.setup(options)
	M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})

	-- Set Cursor highlight
	vim.cmd("highlight Cursor guifg=#0f1013 guibg=#10B1FE")

	-- Set guicursor option
	if M.config.guicursor then
		vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"
	end
end

function M.load()
	local theme_creator = require("highlights.tinta")
	local theme = theme_creator(M.config.palette) -- Use config palette
	vim.g.colors_name = M.config.palette == "tinta" and "tinta" or ("tinta-" .. M.config.palette)
	package.loaded["highlights.tinta"] = nil

	-- transparent
	if M.config.transparent == true then
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

	if M.config.bg_color and M.config.bg_color ~= "" then
		local bg = hsl(M.config.bg_color)

		-- Extend the palette as a Lush spec
		theme = lush.extends({ theme }).with(function()
			return {
				Normal({ bg = bg }),
				NormalFloat({ bg = bg }),
				NormalSB({ bg = bg }),
				BufferlineFill({ bg = bg }),
				TroubleNormal({ bg = bg }),
				NvimTreeNormal({ bg = bg }),
				NvimTreeNormalNC({ bg = bg }),
				BufferInactive({ bg = bg }),
				BufferVisible({ bg = bg }),
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
