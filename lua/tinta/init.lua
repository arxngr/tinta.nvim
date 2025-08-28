local lush = require("lush")
local M = {}

local isGui = vim.fn.has("gui_running") == 1

local defaultConfig = {
	transparent = false,
	terminal = isGui,
	guicursor = true,
	bg_color = nil,
	rainbow_headings = false,
}

M.config = defaultConfig

function M.setup(options)
	M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})

	-- Set the Cursor highlight group: blackish text, blue background
	vim.cmd("highlight Cursor guifg=#0f1013 guibg=#10B1FE")

	-- Set the guicursor option with the right modes and Cursor highlight
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

	-- Apply user-defined background only if bg_color is not empty
	if M.config.bg_color ~= "" then
		theme = lush.extends({ theme }).with(function()
			return {
				Normal({ bg = M.config.bg_color }),
				NormalSB({ bg = M.config.bg_color }),
				BufferlineFill({ bg = M.config.bg_color }),
				TroubleNormal({ bg = M.config.bg_color }),
				NvimTreeNormal({ bg = M.config.bg_color }),
				NvimTreeNormalNC({ bg = M.config.bg_color }),
				BufferInactive({ bg = M.config.bg_color }),
				BufferVisible({ bg = M.config.bg_color }),
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
