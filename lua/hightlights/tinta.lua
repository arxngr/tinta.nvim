local lush = require("lush")
local hsl = lush.hsl

local pallete = {
	-- syntax
	bg = hsl("#0f1013"),
	bgFloat = hsl("#0f1013"),
	fg = hsl("#ABB2BF"),
	cursor = hsl("#072952"),
	keyword = hsl("#10B1FE"),
	comment = hsl("#636D83"),
	punctuation = hsl("#10B1FE"),
	method = hsl("#3FC56B"),
	type = hsl("#10B1FE"),
	string = hsl("#F9C859"),
	number = hsl("#FF78F8"),
	constant = hsl("#9F7EFE"),
	tag = hsl("#3691FF"),
	attribute = hsl("#10B1FE"),
	property = hsl("#f0c6c6"),
	parameter = hsl("#78d1ff"),
	label = hsl("#50acae"),
	module = hsl("#10B1FE"),
	-- workspace
	primary = hsl("#3691ff"),
	selection = hsl("#274670"),
	search = hsl("#1A7247"),
	diffAdd = hsl("#105B3D"),
	diffChange = hsl("#10415B"),
	diffDelete = hsl("#522E34"),
	added = hsl("#177F55"),
	changed = hsl("#1B6E9B"),
	deleted = hsl("#A14D5B"),
	diffText = hsl("#10415B").lighten(12),
	error = hsl("#ff2e3f"),
	errorBG = hsl("#FDCFD1"),
	warning = hsl("#f9c858"),
	warningBG = hsl("#F2DBCF"),
	info = hsl("#3691ff"),
	infoBG = hsl("#D4E3FA"),
	hint = hsl("#7982DA"),
	mergeCurrent = hsl("#4B3D3F"),
	mergeCurrentLabel = hsl("#604B47"),
	mergeIncoming = hsl("#2F476B"),
	mergeIncomingLabel = hsl("#305C95"),
	mergeParent = hsl(235, 28, 32),
	mergeParentLabel = hsl(235, 29, 41),
	copilot = hsl("#95A922"),

	-- terminal
	terminalBlack = hsl("#42444d"),
	terminalRed = hsl("#fc2e51"),
	terminalGreen = hsl("#25a45c"),
	terminalYellow = hsl("#ff9369"),
	terminalBlue = hsl("#3375fe"),
	terminalMagenta = hsl("#9f7efe"),
	terminalCyan = hsl("#4483aa"),
	terminalWhite = hsl("#cdd3e0"),
	terminalBrightBlack = hsl("#8f9aae"),
	terminalBrightRed = hsl("#ff637f"),
	terminalBrightGreen = hsl("#3fc56a"),
	terminalBrightYellow = hsl("#f9c858"),
	terminalBrightBlue = hsl("#10b0fe"),
	terminalBrightMagenta = hsl("#ff78f8"),
	terminalBrightCyan = hsl("#5fb9bc"),
	terminalBrightWhite = hsl("#ffffff"),
	rainbowRed = hsl("#FF6666"),
	rainbowYellow = hsl("#f4ff78"),
	rainbowBlue = hsl("#44A5FF"),
	rainbowOrange = hsl("#ffa023"),
	rainbowGreen = hsl("#92f535"),
	rainbowViolet = hsl("#ff78ff"),
	rainbowCyan = hsl("#28e4eb"),
	rainbowIndigo = hsl("#9F7EFE"),
}

local t = pallete

local function shade(color, value)
	return color.darken(value)
end

t.shade1 = shade(t.bg, 1)
t.shade2 = shade(t.bg, 2)
t.shade3 = shade(t.bg, 3)
t.shade4 = shade(t.bg, 4)
t.shade5 = shade(t.bg, 5)
t.shade6 = shade(t.bg, 6)
t.shade7 = shade(t.bg, 7)
t.shade8 = shade(t.bg, 8)
t.shade9 = shade(t.bg, 9)
t.shade10 = shade(t.bg, 10)
t.shade20 = shade(t.bg, 20)
t.shade25 = shade(t.bg, 25)
t.shade30 = shade(t.bg, 30)
t.shade40 = shade(t.bg, 40)
t.shade50 = shade(t.bg, 50)
t.shade60 = shade(t.bg, 60)
t.shade70 = shade(t.bg, 70)
t.shade80 = shade(t.bg, 80)
t.shade90 = shade(t.bg, 90)

t.grey3 = t.shade3.mix(t.primary, 3)
t.grey5 = t.shade5.mix(t.primary, 5)
t.grey7 = t.shade7.mix(t.primary, 7)
t.grey10 = t.shade10.mix(t.primary, 10)
t.grey20 = t.shade20.mix(t.primary, 10)
t.grey25 = t.shade25.mix(t.primary, 10)
t.grey30 = t.shade30.mix(t.primary, 10)
t.grey40 = t.shade40.mix(t.primary, 12)

t.white = hsl("#ffffff")
t.green = hsl("#008200")

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		Normal({ fg = t.fg, bg = t.bg }), -- normal text
		CursorLine({ bg = t.cursor }), -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorColumn({ CursorLine }), -- Screen-column at the cursor, when 'cursorcolumn' is set.
		Whitespace({ fg = t.grey10 }),
		Comment({ fg = t.comment }),
		LineNr({ fg = t.comment }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr({ fg = t.keyword }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		Search({ bg = t.search }),
		IncSearch({ bg = t.cursor.mix(t.bg, 10), fg = t.property }),
		CurSearch({ Search }),
		NormalFloat({ bg = t.bgFloat, blend = 5 }), -- Normal text in floating windows.
		FloatBorder({ fg = t.punctuation }),
		NormalSB({ bg = t.bgFloat }), -- Normal text in floating windows.
		ColorColumn({ bg = t.grey5 }), -- used for the columns set with 'colorcolumn'
		Conceal({}), -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = t.cursor, fg = t.keyword }), -- character under the cursor
		lCursor({ Cursor }), -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM({ Cursor }), -- like Cursor, but used when in IME mode |CursorIM|
		Directory({ fg = t.keyword }), -- directory names (and other special names in listings)
		Added({ fg = t.method }),
		Changed({ fg = t.tag }), -- diff mode: Changed line |diff.txt|
		Removed({ fg = t.type }), -- diff mode: Deleted line |diff.txt|
		DiffAdd({ bg = t.diffAdd }), -- diff mode: Added line |diff.txt|
		DiffChange({ bg = t.diffChange }), -- diff mode: Changed line |diff.txt|
		DiffDelete({ bg = t.diffDelete }), -- diff mode: Deleted line |diff.txt|
		DiffText({ bg = t.diffText }), -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ fg = t.punctuation }), -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		TermCursor({ Cursor }), -- cursor in a focused terminal
		TermCursorNC({}), -- cursor in an unfocused terminal
		ErrorMsg({ fg = t.error }), -- error messages on the command line
		VertSplit({ fg = t.grey30 }), -- the column separating vertically split windows
		Winseparator({ VertSplit }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		Folded({ bg = t.shade7, fg = t.tag }), -- line used for closed folds
		SignColumn({ Normal }), -- column where |signs| are displayed
		FoldColumn({ SignColumn }), -- 'foldcolumn'
		Substitute({ IncSearch }), -- |:substitute| replacement text highlighting
		MatchParen({ bg = t.punctuation, fg = t.bg }), -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg({ Normal }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ fg = t.keyword }), -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = t.primary }), -- |more-prompt|
		NonText({ fg = t.comment }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		NormalNC({ Normal }), -- normal text in non-current windows
		-- Pmenu { bg = t.bg, blend = 5 },
		Pmenu({ NormalFloat }),
		PmenuSel({ bg = t.selection }), -- Popup menu: selected item.
		PmenuSbar({ bg = t.grey5 }), -- Popup menu: scrollbar.
		PmenuThumb({ bg = t.punctuation }), -- Popup menu: Thumb of the scrollbar.
		Question({ fg = t.primary }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ bg = t.primary, fg = t.white }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		SpecialKey({ fg = t.attribute }), -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- TODO: spelling
		-- SpellBad     { gui = "undercurl", sp = t.error  }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		--
		StatusLine({ bg = t.grey10, gui = "" }), -- status line of current window
		StatusLineNC({ bg = t.shade5 }), -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		--
		TabLine({ bg = t.shade3, fg = t.shade30 }), -- tab pages line, not active tab page label
		TabLineFill({ bg = t.bg }), -- tab pages line, where there are no labels
		TabLineSel({ bg = t.shade10, sp = t.primary, gui = "underline" }), -- tab pages line, active tab page label
		--
		File({ fg = t.primary }), -- titles for output from ":set all", ":autocmd" etc.
		Title({ fg = t.primary }), -- titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = t.selection }), -- Visual mode selection
		VisualNOS({ bg = t.selection }), -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = t.warning }), -- warning messages
		WildMenu({ bg = t.selection }), -- current match in 'wildmenu' completion
		--
		Constant({ fg = t.constant }), -- (preferred) any constant
		String({ fg = t.string }), --   a string constant: "this is a string"
		Character({ fg = t.attribute }), --  a character constant: 'c', '\n'
		Number({ fg = t.number }), --   a number constant: 234, 0xff
		Boolean({ fg = t.keyword }), --  a boolean constant: TRUE, false
		-- Float          { }, --    a floating point constant: 2.3e10
		Identifier({ fg = t.fg }), -- (preferred) any variable name
		Function({ fg = t.method }), -- function name (also: methods for classes)
		Method({ fg = t.method }), -- function name (also: methods for classes)
		Property({ fg = t.property }),
		Field({ Property }),
		Parameter({ fg = t.parameter }),
		Statement({ fg = t.keyword }), -- (preferred) any statement
		-- Conditional    { }, --  if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --    case, default, etc.
		Punctuation({ fg = t.punctuation }), -- "sizeof", "+", "*", etc.
		Operator({ fg = t.punctuation }), -- "sizeof", "+", "*", etc.
		Keyword({ Statement }), --  any other keyword
		-- Exception      { }, --  try, catch, throw
		PreProc({ fg = t.keyword }), -- (preferred) generic Preprocessor
		-- Include        { }, --  preprocessor #include
		-- Define         { }, --   preprocessor #define
		-- Macro          { }, --    same as Define
		-- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.
		Type({ fg = t.type }), -- (preferred) int, long, char, etc.
		Struct({ Type }),
		Class({ Type }),
		-- StorageClass   { }, -- static, register, volatile, etc.
		-- Structure      { }, --  struct, union, enum, etc.
		-- Typedef        { }, --  A typedef
		Special({ Character }), -- (preferred) any special symbol
		Attribute({ Character }), -- (preferred) any special symbol
		-- SpecialChar {}, --  special character in a constant
		Tag({ fg = t.tag }), --    you can use CTRL-] on this
		-- Delimiter {}, --  character that needs attention
		-- SpecialComment { }, -- special things inside a comment
		-- Debug          { }, --    debugging statements
		Underlined({ gui = "underline" }), -- (preferred) text that stands out, HTML links
		Bold({ gui = "bold" }),
		Italic({ gui = "italic" }),
		-- ("Ignore", below, may be invisible...)
		Ignore({ fg = t.bg }), -- (preferred) left blank, hidden  |hl-Ignore|
		Error({ ErrorMsg }), -- (preferred) any erroneous construct
		Todo({ bg = t.info, fg = t.white }), -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		WinBar({ fg = t.tag, gui = "bold" }),
		WinBarNC({ fg = t.fg, gui = "" }),

		--
		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ Error }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ WarningMsg }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = t.info }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = t.hint }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError({ DiagnosticError, bg = t.bg.mix(t.error, 20) }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ DiagnosticWarn, bg = t.bg.mix(t.warning, 20) }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ DiagnosticInfo, bg = t.bg.mix(t.info, 20) }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ DiagnosticHint, bg = t.bg.mix(t.hint, 20) }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticUnderlineError({ gui = "undercurl", sp = t.error }), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({ gui = "undercurl", sp = t.warning }), -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo({ gui = "undercurl", sp = t.info }), -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint({ gui = "undercurl", sp = t.hint }), -- Used to underline "Hint" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.

		-- These groups are for the neovim tree-sitter highlights.
		-- As of writing, tree-sitter support is a WIP, group names may change.
		-- By default, most of these groups link to an appropriate Vim group,
		-- TSError -> Error for example, so you do not have to define these unless
		-- you explicitly want to support Treesitter's improved syntax awareness.

		--
		-- TSError              { }, -- For syntax/parser errors.
		sym("@constructor")({ fg = t.type }),
		sym("@operator")({ fg = t.punctuation }),
		sym("@punctuation")({ fg = t.punctuation }),
		sym("@punctuation.bracket")({ fg = t.punctuation }),
		sym("@punctuation.delimiter")({ fg = t.punctuation }),
		sym("@punctuation.special")({ fg = t.punctuation }),
		sym("@symbol")({ fg = t.constant }),
		sym("@constant")({ fg = t.constant }),
		sym("@constant.builtin")({ fg = t.keyword }),
		sym("@comment")({ fg = t.comment }),
		sym("@string.escape")({ Character }),
		sym("@method")({ fg = t.method }),
		sym("@function")({ fg = t.method }),
		sym("@function.call")({ fg = t.method }),
		sym("@function.builtin")({ fg = t.method }),
		sym("@parameter")({ fg = t.parameter, gui = "italic" }),
		sym("@field")({ Property }),
		sym("@property")({ Property }),
		sym("@label")({ fg = t.label }), -- For labels: `label:` in C and `:label:` in Lua.
		sym("@type")({ Type }),
		sym("@type.builtin")({ fg = t.keyword }),
		sym("@type.qualifier")({ Statement }),
		sym("@keyword")({ Statement }),
		sym("@keyword.modifier")({ Statement }), -- Same as @type.qualifier
		sym("@string")({ String }),
		sym("@namespace")({ fg = t.module }),
		sym("@number")({ fg = t.number }),
		sym("@annotation")({ sym("@label") }), -- For labels: `label:` in C and `:label:` in Lua.
		sym("@text")({ Identifier }),
		sym("@text.strong")({ Bold }),
		sym("@text.italic")({ Italic }),
		sym("@text.underline")({ Underlined }),
		sym("@text.title")({ fg = t.keyword }),
		sym("@text.literal")({ Property }),
		sym("@text.uri")({ fg = t.tag, sp = t.tag, gui = "underline" }), -- Any URI like a link or email.
		sym("@variable")({ Identifier }), -- Variable names that are defined by the languages, like `this` or `self`.
		sym("@variable.constant")({ Constant }), -- Variable names that are defined by the languages, like `this` or `self`.
		sym("@variable.builtin")({ Statement }), -- Variable names that are defined by the languages, like `this` or `self`.
		sym("@tag")({ Tag }),
		sym("@tag.builtin")({ Tag }),
		sym("@attribute")({ fg = t.label }), -- Variable names that are defined by the languages, like `this` or `self`.
		sym("@tag.attribute")({ fg = t.attribute }), -- Variable names that are defined by the languages, like `this` or `self`.
		sym("@error")({ Error }), -- Variable names that are defined by the languages, like `this` or `self`.
		sym("@warning")({ WarningMsg }),
		sym("@info")({ fg = t.info }),
		--
		-- sym("@markup.link.label")    { }, -- SpecialChar
		-- sym("@character.special")    { }, -- SpecialChar
		-- sym("@function.macro")       { }, -- Macro
		-- sym("@keyword.debug")        { }, -- Debug

		-- Language Overrides
		-- JSON
		sym("@label.json")({ fg = t.property }), -- For labels: `label:` in C and `:label:` in Lua.
		sym("@label.jsonc")({ fg = t.property }), -- For labels: `label:` in C and `:label:` in Lua.
		-- help files
		sym("@label.help")({ sym("@text.uri") }),
		-- html
		sym("@text.uri.html")({ gui = "underline" }),

		-- Treesitter highlight groups update
		-- Treesitter standard capture groups
		sym("@variable.parameter")({ sym("@parameter") }),
		sym("@variable.member")({ sym("@field") }),
		sym("@module")({ sym("@namespace") }),
		sym("@string.special.symbol")({ sym("@symbol") }),
		sym("@markup.strong")({ sym("@text.strong") }),
		sym("@markup.underline")({ sym("@text.underline") }),
		sym("@markup.heading")({ sym("@text.title") }),
		sym("@markup.link.url")({ sym("@text.uri") }),
		sym("@markup.raw")({ sym("@text.literal") }),
		sym("@markup.list")({ sym("@punctuation.special") }),

		-- Helix capture groups
		sym("@function.method")({ sym("@method") }),
		sym("@string.special.url")({ sym("@text.uri") }),

		-- semantic highlighting

		sym("@lsp.type.comment")({ sym("@comment") }),
		sym("@lsp.type.namespace")({ sym("@namespace") }),
		sym("@lsp.type.type")({ sym("@type") }),
		sym("@lsp.type.typeParameter")({ sym("@type") }),
		sym("@lsp.type.class")({ sym("@type") }),
		sym("@lsp.type.enum")({ sym("@type") }),
		sym("@lsp.type.interface")({ sym("@type") }),
		sym("@lsp.type.struct")({ sym("@type") }),
		sym("@lsp.type.parameter")({ sym("@parameter") }),
		sym("@lsp.type.variable")({ sym("@variable") }),
		sym("@lsp.type.property")({ sym("@property") }),
		sym("@lsp.type.enumMember")({ sym("@constant") }),
		sym("@lsp.type.function")({ sym("@function") }),
		sym("@lsp.type.method")({ sym("@method") }),
		sym("@lsp.type.label")({ sym("@label") }),
		sym("@lsp.type.macro")({ sym("@label") }),
		sym("@lsp.type.decorator")({ sym("@label") }),
		sym("@lsp.type.string")({ sym("@string") }),
		sym("@lsp.type.regexp")({ sym("@string") }),
		sym("@lsp.type.keyword")({ sym("@keyword") }),
		sym("@lsp.type.number")({ sym("@number") }),
		sym("@lsp.type.operator")({ sym("@operator") }),
		sym("@lsp.type.event")({ sym("@parameter") }),
		sym("@lsp.mod.readonly")({ sym("@constant") }),
		sym("@lsp.mod.constant")({ sym("@constant") }),
		sym("@lsp.typemod.variable.constant")({ sym("@constant") }),
		sym("@lsp.typemod.function.declaration")({ sym("@function") }),
		sym("@lsp.typemod.function.readonly")({ sym("@function") }),
		sym("LspInlayHint")({ bg = t.shade2, fg = t.comment }),

		-- gui vim
		-- VimR
		VimrDefaultCursor({ fg = t.keyword, bg = t.bg }),
		VimrInsertCursor({ fg = t.keyword, bg = t.bg }),
		--  gitsigns
		GitSignsAdd({ fg = t.added }),
		GitSignsChange({ fg = t.changed }),
		GitSignsDelete({ fg = t.deleted }),
		GitSignsUntracked({ GitSignsAdd }),
		GitSignsUntrackedNr({ GitSignsUntracked }),
		GitSignsUntrackedCul({ GitSignsUntracked }),
		GitSignsStagedAdd({ bg = t.added, fg = t.bg }),
		GitSignsStagedAddNr({ GitSignsStagedAdd }),
		GitSignsStagedAddCul({ GitSignsStagedAdd }),
		GitSignsStagedUntracked({ GitSignsStagedAdd }),
		GitSignsStagedUntrackedNr({ GitSignsStagedUntracked }),
		GitSignsStagedUntrackedCul({ GitSignsStagedUntracked }),
		GitSignsStagedDelete({ bg = t.deleted, fg = t.bg }),
		GitSignsStagedDeleteNr({ GitSignsStagedDelete }),
		GitSignsStagedDeleteCul({ GitSignsStagedDelete }),
		GitSignsStagedChangedelete({ GitSignsStagedDelete }),
		GitSignsStagedChangedeleteNr({ GitSignsStagedChangedelete }),
		GitSignsStagedChangedeleteCul({ GitSignsStagedChangedelete }),
		GitSignsStagedTopdelete({ GitSignsStagedDelete }),
		GitSignsStagedTopdeleteNr({ GitSignsStagedTopdelete }),
		GitSignsStagedTopdeleteCul({ GitSignsStagedTopdelete }),
		GitSignsStagedChange({ bg = t.changed, fg = t.bg }),
		GitSignsStagedChangeNr({ GitSignsStagedChange }),
		GitSignsStagedChangeCul({ GitSignsStagedChange }),
		-- TODO: improve bufferline
		BufferlineFill({ NormalFloat }),
		-- BufferlineBackground { bg = t.bg },
		-- BufferlineDevIconLua { bg = t.bg, fg = t.keyword },
		-- BufferlineDevIconLuaSelected { bg = t.bg, fg = t.keyword },
		-- BufferlineBufferVisible { bg = t.bg },
		-- BufferlineBufferSelected { bg = t.bg },

		-- BufferlineIndicatorVisible { bg = t.type }, -- shows which buffers are visible in windows currently

		-- BufferLineSeparatorSelected { fg = t.type, sp = t.primary, gui = "underline" },
		-- BufferLineWarningDiagnosticSelected { fg = t.warning, sp = t.primary, gui = "underline" },
		-- BufferLineErrorDiagnosticSelected { fg = t.error, sp = t.primary, gui = "underline" },
		-- BufferLineInfoDiagnosticSelected { fg = t.info, sp = t.primary, gui = "underline" },
		-- BufferLineHintDiagnosticSelected { fg = t.hint, sp = t.primary, gui = "underline" },
		-- BufferLineTabSeparatorSelected { sp = t.primary, gui = "underline" },
		-- BufferLineCloseButtonSelected { sp = t.primary, gui = "underline" },
		-- BufferLineDiagnosticSelected { sp = t.primary, gui = "underline" },
		-- BufferLineDevIconLuaSelected { sp = t.primary, gui = "underline" },
		-- BufferLineIndicatorSelected { sp = t.primary, gui = "underline" },
		-- BufferLineDuplicateSelected { sp = t.primary, gui = "underline" },
		-- BufferLineModifiedSelected { sp = t.primary, gui = "underline" },
		-- BufferLineNumbersSelected { sp = t.primary, gui = "underline" },
		BufferLineBufferSelected({ sp = t.primary, gui = "underline" }),
		-- BufferLinePickSelected { sp = t.primary, gui = "underline" },
		-- BufferLineTabSelected { sp = t.primary, gui = "underline" },
		-- BufferLineWarningSelected { fg = t.warning, sp = t.primary, gui = "underline" },
		-- BufferLineErrorSelected { fg = t.error, sp = t.primary, gui = "underline" },
		-- BufferLineInfoSelected { fg = t.info, sp = t.primary, gui = "underline" },
		-- BufferLineHintSelected { fg = t.hint, sp = t.primary, gui = "underline" },
		--

		-- BarBar
		BufferCurrent({ Normal }),
		BufferCurrentIndex({ BufferCurrent }),
		BufferCurrentIcon({ BufferCurrentIndex }),
		BufferCurrentMod({ BufferCurrent }),
		BufferCurrentSign({ fg = t.keyword, bg = BufferCurrent.bg }),
		BufferCurrentTarget({ BufferCurrent, fg = t.type }),
		BufferCurrentWARN({ fg = DiagnosticWarn.fg, bg = BufferCurrent.bg }),
		BufferCurrentINFO({ fg = DiagnosticInfo.fg, bg = BufferCurrent.bg }),
		BufferCurrentERROR({ fg = DiagnosticError.fg, bg = BufferCurrent.bg }),
		BufferCurrentHINT({ fg = DiagnosticHint.fg, bg = BufferCurrent.bg }),
		--
		BufferInactive({ fg = t.shade40, bg = t.bgFloat }),
		BufferInactiveIcon({ BufferInactive }),
		BufferInactiveIndex({ BufferInactive }),
		BufferInactiveMod({ BufferInactive }),
		BufferInactiveSign({ BufferInactive }),
		BufferInactiveTarget({ BufferInactive, fg = t.type }),
		BufferInactiveWARN({ BufferCurrentWARN, bg = BufferInactive.bg }),
		BufferInactiveINFO({ BufferCurrentINFO, bg = BufferInactive.bg }),
		BufferInactiveERROR({ BufferCurrentERROR, bg = BufferInactive.bg }),
		BufferInactiveHINT({ BufferCurrentHINT, bg = BufferInactive.bg }),
		--
		BufferVisible({ BufferCurrent, bg = t.bgFloat }),
		BufferVisibleIndex({ BufferVisible }),
		BufferVisibleIcon({ BufferVisibleIndex }),
		BufferVisibleMod({ BufferVisible }),
		BufferVisibleSign({ BufferVisible }),
		BufferVisibleTarget({ BufferVisible, fg = t.type }),
		BufferVisibleWARN({ BufferInactiveWARN }),
		BufferVisibleINFO({ BufferInactiveINFO }),
		BufferVisibleERROR({ BufferInactiveERROR }),
		BufferVisibleHINT({ BufferInactiveHINT }),
		--
		BufferAlternate({ BufferInactive }),
		BufferAlternateIndex({ BufferAlternate }),
		BufferAlternateIcon({ BufferAlternateIndex }),
		BufferAlternateMod({ BufferInactiveMod }),
		BufferAlternateSign({ BufferInactiveSign, fg = t.constant }),
		BufferAlternateTarget({ BufferAlternate, fg = t.type }),
		BufferAlternateWARN({ BufferInactiveWARN }),
		BufferAlternateINFO({ BufferInactiveINFO }),
		BufferAlternateERROR({ BufferInactiveERROR }),
		BufferAlternateHINT({ BufferInactiveHINT }),
		--
		BufferTabpages({ BufferInactive, fg = t.fg }),
		BufferTabpageFill({ BufferTabpages, fg = t.bg }),
		BufferOffset({ BufferTabpageFill }),
		--

		-- Telescope
		-- Sets the highlight for selected items within the picker.
		-- TelescopeSelection  {},
		-- TelescopeSelectionCaret  {},
		TelescopeMultiSelection({ fg = t.attribute }),
		TelescopeMultiIcon({ fg = t.primary }),
		--
		-- -- "Normal" in the floating windows created by telescope.
		-- TelescopeNormal { fg = t.fg, bg = t.bg },
		-- TelescopeNormal { fg = t.fg, bg = t.bg, blend = 5 },
		TelescopeNormal({ NormalFloat }),
		-- TelescopePreviewNormal  {},
		-- TelescopePromptNormal { fg = t.fg, bg = t.bg },
		-- TelescopeResultsNormal  {},

		-- Border highlight groups.
		-- Use TelescopeBorder to override the default.
		-- Otherwise set them specifically

		TelescopeBorder({ NormalFloat, fg = t.punctuation }),
		-- TelescopePromptBorder  {},
		-- TelescopeResultsBorder  {},
		-- TelescopePreviewBorder  {},

		-- -- Title highlight groups.
		-- --   Use TelescopeTitle to override the default.
		-- --   Otherwise set them specifically
		-- TelescopeTitle  {fg = t.constant},
		-- TelescopePromptTitle  {},
		-- TelescopeResultsTitle  {},
		-- TelescopePreviewTitle  {},

		-- TelescopePromptCounter  {},

		-- -- Used for highlighting characters that you match.
		TelescopeMatching({ fg = t.keyword }),
		-- -- Used for the prompt prefix
		TelescopePromptPrefix({ fg = t.punctuation }),
		-- -- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
		-- TelescopePreviewLine  {},
		-- TelescopePreviewMatch  {},

		-- TelescopePreviewPipe  {},
		-- TelescopePreviewCharDev  {},
		-- TelescopePreviewDirectory  {},
		-- TelescopePreviewBlock  {},
		TelescopePreviewLink({ fg = t.label }),
		TelescopePreviewSocket({ fg = t.property }),
		-- TelescopePreviewRead  {},
		TelescopePreviewWrite({ fg = t.type }),
		TelescopePreviewExecute({ fg = t.method }),
		-- TelescopePreviewHyphen  {},
		-- TelescopePreviewSticky  {},
		TelescopePreviewSize({ fg = t.number }),
		TelescopePreviewUser({ fg = t.property }),
		TelescopePreviewGroup({ fg = t.property }),
		TelescopePreviewDate({ fg = t.string }),
		-- TelescopePreviewMessage  {},
		-- TelescopePreviewMessageFillchar  {},

		-- -- Used for Picker specific Results highlighting
		TelescopeResultsClass({ Class }),
		-- TelescopeResultsConstant  {},
		TelescopeResultsField({ Field }),
		-- TelescopeResultsFunction  {},
		-- TelescopeResultsMethod  {},
		-- TelescopeResultsOperator  {},
		-- TelescopeResultsStruct  {},
		TelescopeResultsVariable({ Identifier }),
		-- TelescopeResultsLineNr  {},
		-- TelescopeResultsIdentifier  {},
		-- TelescopeResultsNumber  {},
		-- TelescopeResultsComment  {},
		TelescopeResultsSpecialComment({ Comment }),
		-- -- Used for git status Results highlighting
		-- TelescopeResultsDiffChange  {},
		-- TelescopeResultsDiffAdd  {},
		-- TelescopeResultsDiffDelete  {},
		-- TelescopeResultsDiffUntracked  {},

		-- Fzf-lua
		FzfLuaNormal({ NormalFloat }),
		FzfLuaBorder({ NormalFloat, fg = t.punctuation }),
		FzfLuaTitle({ NormalFloat, fg = t.punctuation }),
		-- FzfLuaBackdrop {},
		FzfLuaPreviewNormal({ NormalFloat }),
		FzfLuaPreviewBorder({ NormalFloat, fg = t.punctuation }),
		-- FzfLuaPreviewTitle { NormalFloat, fg = t.punctuation },
		-- FzfLuaCursor { Cursor },
		FzfLuaCursorLine({ Visual }),
		FzfLuaCursorLineNr({ Visual }),
		-- FzfLuaSearch { IncSearch },
		-- FzfLuaScrollBorderEmpty { NormalFloat, fg = t.punctuation },
		-- FzfLuaScrollBorderFull { NormalFloat, fg = t.punctuation },
		-- FzfLuaScrollFloatEmpty { PmenuSbar },
		-- FzfLuaScrollFloatFull { PmenuThumb },
		-- FzfLuaHelpNormal { NormalFloat },
		-- FzfLuaHelpBorder { NormalFloat, fg = t.punctuation },
		FzfLuaHeaderBind({ Character }),
		FzfLuaHeaderText({ fg = t.method }),
		FzfLuaPathColNr({ Number }),
		FzfLuaPathLineNr({ Number }),
		FzfLuaBufName({ fg = t.fg }),
		FzfLuaBufNr({ Number }),
		FzfLuaBufFlagCur({ fg = t.keyword }),
		FzfLuaBufFlagAlt({ fg = t.tag }),
		FzfLuaTabTitle({ fg = t.parameter }),
		FzfLuaTabMarker({ fg = t.keyword }),
		-- FzfLuaDirIcon { Directory },
		-- FzfLuaDirPart { Comment },
		FzfLuaFilePart({ fg = t.fg }),
		FzfLuaLiveSym({ fg = t.keyword }),

		-- Fzf-lua fzf colours
		-- FzfLuaFzfNormal { NormalFloat },
		FzfLuaFzfCursorLine({ Visual, fg = shade(t.fg, 70) }),
		FzfLuaFzfMatch({ fg = t.keyword }),
		-- FzfLuaFzfBorder { NormalFloat, fg = t.punctuation },
		-- FzfLuaFzfScrollbar { NormalFloat, fg = t.punctuation },
		-- FzfLuaFzfSeparator { NormalFloat, fg = t.punctuation },
		-- FzfLuaFzfGutter { NormalFloat },
		-- FzfLuaFzfHeader { NormalFloat, fg = t.punctuation },
		-- FzfLuaFzfInfo { NonText },
		FzfLuaFzfPointer({ Visual }),
		-- FzfLuaFzfMarker { Special },
		-- FzfLuaFzfSpinner { Special },
		FzfLuaFzfPrompt({ fg = t.punctuation }),
		-- FzfLuaFzfQuery { NormalFloat },

		-- lspsaga
		TitleIcon({ Function }),
		SagaNormal({ NormalFloat }),
		SagaExpand({ Normal }),
		SagaCollapse({ SagaExpand }),
		SagaCount({ Number }),
		SagaBeacon({ bg = t.cursor, blend = 70 }),
		CodeActionNumber({ Statement }),
		FinderSelection({ Visual }),
		-- FinderFileName { Comment },
		FinderCount({ Number }),
		FinderIcon({ Punctuation }),
		FinderType({ Title }),
		SagaLightBulb({ Attribute }),
		-- SagaShadow { FloatShadow },
		OutlineIndent({ Whitespace }),
		--
		-- lspsaga winbar
		-- SagaWinbarModule {},
		-- SagaWinbarInterface {},
		-- SagaWinbarConstructor {},
		-- SagaWinbarStruct {},
		-- SagaWinbarObject {},
		-- SagaWinbarUnit {},
		SagaWinbarFile({ fg = t.terminalCyan }),
		SagaWinbarSnippet({ fg = t.label }),
		-- SagaWinbarText {},
		-- SagaWinbarTypeAlias {},
		-- SagaWinbarEvent {},
		-- SagaWinbarParameter {},
		SagaWinbarKey({ Property }),
		SagaWinbarValue({ String }),
		-- SagaWinbarMacro {},
		-- SagaWinbarNumber {},
		-- SagaWinbarConstant {},
		-- SagaWinbarFunction {},
		SagaWinbarEnum({ Type }),
		-- SagaWinbarField {},
		-- SagaWinbarProperty {},
		-- SagaWinbarMethod {},
		SagaWinbarClass({ Type }),
		SagaWinbarFolder({ Tag }),
		-- SagaWinbarPackage {},
		-- SagaWinbarStaticMethod {},
		-- SagaWinbarTypeParameter {},
		SagaWinbarEnumMember({ Property }),
		-- SagaWinbarOperator {},
		SagaWinbarNull({ Statement }),
		-- SagaWinbarNamespace {},
		-- SagaWinbarArray {},
		-- SagaWinbarBoolean {},
		-- SagaWinbarString {},
		-- SagaWinbarVariable {},
		SagaWinbarFilename({ SagaWinbarFile }),
		SagaWinbarFolderName({}),
		SagaWinbarFileIcon({}),
		SagaWinbarSep({ fg = t.punctuation }),
		--

		-- Trouble
		TroubleCount({ fg = t.number }),
		TroubleNormal({ bg = t.bgFloat }),
		-- TroubleTextInformation {},
		-- TroubleSignWarning {},
		TroubleLocation({ fg = t.attribute }),
		-- TroubleWarning {},
		-- TroublePreview {},
		-- TroubleTextError {},
		-- TroubleSignInformation {},
		-- TroubleIndent {},
		-- TroubleSource {},
		-- TroubleSignHint {},
		-- TroubleSignOther {},
		-- TroubleFoldIcon {},
		-- TroubleTextWarning {},
		-- TroubleCode {},
		-- TroubleInformation {},
		-- TroubleSignError { fg = t.number},
		-- TroubleFile {},
		-- TroubleHint {},
		-- TroubleTextHint {},
		TroubleText({}),
		--

		-- Nvim Cmp
		CmpDocumentation({ fg = t.fg, bg = t.bgFloat }),
		CmpDocumentationBorder({ fg = t.punctuation, bg = t.bgFloat }),
		CmpItemAbbr({ fg = t.fg }),
		CmpItemAbbrDeprecated({ fg = t.fg, gui = "strikethrough" }),
		CmpItemAbbrMatch({ fg = t.primary }),
		CmpItemAbbrMatchFuzzy({ fg = t.primary }),
		CmpItemMenu({ fg = t.attribute }),
		CmpItemKindText({ fg = t.comment }),
		CmpItemKindDefault({ fg = t.fb }),
		CmpItemKindKeyword({ fg = t.keyword }),
		CmpItemKindVariable({ fg = t.fg }),
		CmpItemKindConstant({ fg = t.constant }),
		CmpItemKindReference({ fg = t.fg }),
		CmpItemKindValue({ fg = t.fg }),
		CmpItemKindFunction({ fg = t.method }),
		CmpItemKindMethod({ fg = t.method }),
		CmpItemKindConstructor({ fg = t.type }),
		CmpItemKindClass({ fg = t.type }),
		CmpItemKindInterface({ fg = t.type }),
		CmpItemKindStruct({ fg = t.type }),
		CmpItemKindEvent({ fg = t.label }),
		CmpItemKindEnum({ fg = t.type }),
		CmpItemKindUnit({ fg = t.number }),
		CmpItemKindModule({ fg = t.keyword }),
		CmpItemKindProperty({ fg = t.property }),
		CmpItemKindField({ fg = t.property }),
		CmpItemKindTypeParameter({ fg = t.type }),
		CmpItemKindEnumMember({ fg = t.type }),
		CmpItemKindOperator({ fg = t.punctuation }),
		CmpItemKindSnippet({ fg = t.label }),
		CmpItemKindCopilot({ fg = t.copilot }),
		CmpItemKindCodeium({ fg = t.copilot }),
		CmpItemKindSupermaven({ fg = t.copilot }),
		CmpItemKindTabNine({ fg = t.copilot }),
		--

		-- Blink Cmp
		BlinkCmpDoc({ fg = t.fg, bg = t.bgFloat }),
		BlinkCmpDocBorder({ fg = t.punctuation, bg = t.bgFloat }),
		BlinkCmpLabel({ fg = t.fg }),
		BlinkCmpLabelDeprecated({ fg = t.fg, gui = "strikethrough" }),
		BlinkCmpLabelMatch({ fg = t.primary }),
		BlinkCmpLabelDetail({ fg = t.attribute }),
		BlinkCmpLabelDescription({ fg = t.attribute }),
		BlinkCmpSource({ fg = t.attribute }),
		BlinkCmpKind({ Special }),
		BlinkCmpKindText({ fg = t.comment }),
		BlinkCmpKindDefault({ fg = t.fb }),
		BlinkCmpKindKeyword({ fg = t.keyword }),
		BlinkCmpKindVariable({ fg = t.fg }),
		BlinkCmpKindConstant({ fg = t.constant }),
		BlinkCmpKindReference({ fg = t.fg }),
		BlinkCmpKindValue({ fg = t.fg }),
		BlinkCmpKindFunction({ fg = t.method }),
		BlinkCmpKindMethod({ fg = t.method }),
		BlinkCmpKindConstructor({ fg = t.type }),
		BlinkCmpKindClass({ fg = t.type }),
		BlinkCmpKindInterface({ fg = t.type }),
		BlinkCmpKindStruct({ fg = t.type }),
		BlinkCmpKindEvent({ fg = t.label }),
		BlinkCmpKindEnum({ fg = t.type }),
		BlinkCmpKindUnit({ fg = t.number }),
		BlinkCmpKindModule({ fg = t.keyword }),
		BlinkCmpKindProperty({ fg = t.property }),
		BlinkCmpKindField({ fg = t.property }),
		BlinkCmpKindTypeParameter({ fg = t.type }),
		BlinkCmpKindEnumMember({ fg = t.type }),
		BlinkCmpKindOperator({ fg = t.punctuation }),
		BlinkCmpKindSnippet({ fg = t.label }),
		BlinkCmpKindCopilot({ fg = t.copilot }),
		BlinkCmpKindCodeium({ fg = t.copilot }),
		BlinkCmpKindSupermaven({ fg = t.copilot }),
		BlinkCmpKindTabNine({ fg = t.copilot }),
		--

		-- nvim illuminate
		IlluminatedWordText({ bg = t.grey7 }),
		IlluminatedWordRead({ bg = t.grey7 }),
		IlluminatedWordWrite({ bg = t.grey7 }),
		--

		-- cursor word
		CursorWord = { bg = t.grey7 },
		CursorWord0 = { bg = t.grey7 },
		CursorWord1 = { bg = t.grey7 },
		--

		-- mason
		MasonNormal({ NormalFloat }),
		MasonHeader({ bg = t.primary, fg = t.bgFloat }),
		MasonHeaderSecondary({ bg = t.constant, fg = t.comment }),
		MasonHighlight({ fg = t.primary }),
		MasonHighlightBlock({ bg = t.primary, fg = t.comment }),
		MasonHighlightBlockBold({ bg = t.primary, fg = t.bgFloat, gui = "bold" }),
		MasonHighlightSecondary({ fg = t.constant }),
		MasonHighlightBlockSecondary({ bg = t.constant, fg = t.comment }),
		MasonHighlightBlockBoldSecondary({ bg = t.constant, fg = t.comment, gui = "bold" }),
		MasonLink({ sym("@text.uri") }),
		MasonMuted({ fg = t.comment }),
		MasonMutedBlock({ bg = t.shade40, fg = t.comment }),
		MasonMutedBlockBold({ bg = t.shade40, fg = t.comment, gui = "bold" }),
		MasonError({ Error }),
		MasonHeading({ gui = "bold,underline", fg = t.comment }),
		--

		-- which-key
		WhichKey({ Character }),
		WhichKeyGroup({ Tag }),
		WhichKeySeparator({ Operator }),
		WhichKeyDesc({ sym("@text.title") }),
		-- WhichKeyFloat {},
		-- WhichKeyBorder {},
		-- WhichKeyValue { Character },

		-- Diffview
		DiffviewStatusAdded({ fg = t.method }),
		DiffviewStatusModified({ fg = t.keyword }),
		DiffviewStatusRenamed({ fg = t.keyword }),
		DiffviewStatusCopied({ fg = t.keyword }),
		DiffviewStatusTypeChanged({ fg = t.keyword }),
		DiffviewStatusUnmerged({ fg = t.number }),
		DiffviewStatusUnknown({ fg = t.property }),
		DiffviewStatusDeleted({ fg = t.type }),
		-- DiffviewStatusBroken {},
		DiffviewStatusIgnored({ fg = t.comment }),
		DiffviewFilePanelInsertions({ fg = t.added }),
		DiffviewFilePanelDeletions({ fg = t.deleted }),
		DiffviewFilePanelRootPath({ fg = t.tag }),
		DiffviewFilePanelTitle({ fg = t.constant }),
		DiffviewFilePanelCounter({ fg = t.attribute }),
		-- DiffviewFilePanelFileName {},
		DiffviewFilePanelPath({ fg = t.comment }),
		DiffviewFilePanelConflicts({ fg = t.number }),
		DiffviewFolderName({ Directory }),
		-- DiffviewFolderSign {},
		-- DiffviewReference {},
		DiffviewPrimary({ fg = t.keyword }),
		DiffviewSecondary({ fg = t.tag }),
		--

		-- vim-fugitive
		diffAdded({ fg = t.method }),
		diffRemoved({ fg = t.type }),
		diffFile({ File }),
		diffNewFile({ fg = t.constant }),
		diffOldFile({ fg = t.property }),
		diffLine({ fg = t.number }),
		diffIndexLine({ fg = t.parameter }),
		diffSubname({ fg = t.string }),
		-- diffOnly {},
		-- diffIdentical {},
		-- diffDiffer {},
		-- diffBDiffer {},
		-- diffIsA {},
		-- diffNoEOL {},
		-- diffCommon {},
		-- diffComment {},

		-- nvim tree
		NvimTreeNormal({ bg = t.bgFloat }),
		NvimTreeNormalNC({ bg = t.bgFloat }),
		NvimTreeWindowPicker({ fg = t.fg, bg = t.selection, gui = "bold" }),
		NvimTreeIndentMarker({ fg = t.punctuation }),
		NvimTreeRootFolder({ fg = t.tag }),
		NvimTreeFolderIcon({ fg = t.keyword }),
		NvimTreeFolderName({ fg = t.tag }),
		NvimTreeOpenedFolderName({ fg = t.keyword }),
		NvimTreeSpecialFile({ fg = t.constant }),
		NvimTreeExecFile({ fg = t.method }),
		NvimTreeGitStaged({ fg = t.method }),
		NvimTreeGitDirty({ fg = t.type }),
		NvimTreeGitMerge({ fg = t.number }),
		NvimTreeGitDeleted({ fg = t.deleted }),
		NvimTreeGitNew({ fg = t.method }),
		--

		-- git-conflict
		GitConflictCurrent({ bg = t.mergeCurrent, blend = 5 }),
		GitConflictIncoming({ bg = t.mergeIncoming, blend = 5 }),
		GitConflictAncestor({ bg = t.mergeParent, blend = 5 }),
		GitConflictCurrentLabel({ bg = t.mergeCurrentLabel, blend = 5 }),
		GitConflictIncomingLabel({ bg = t.mergeIncomingLabel, blend = 5 }),
		GitConflictAncestorLabel({ bg = t.mergeParentLabel, blend = 5 }),
		--

		-- nvim-notify
		NotifyBackground({ NormalFloat }),
		NotifyERRORBorder({ Normal, fg = t.error }),
		NotifyWARNBorder({ Normal, fg = t.warning }),
		NotifyINFOBorder({ Normal, fg = t.info }),
		NotifyDEBUGBorder({ Normal, fg = t.punctuation }),
		NotifyTRACEBorder({ Normal, fg = t.property }),
		NotifyERRORIcon({ NotifyERRORBorder }),
		NotifyWARNIcon({ NotifyWARNBorder }),
		NotifyINFOIcon({ NotifyINFOBorder }),
		NotifyDEBUGIcon({ NotifyDEBUGBorder }),
		NotifyTRACEIcon({ NotifyTRACEBorder }),
		NotifyERRORTitle({ NotifyERRORBorder }),
		NotifyWARNTitle({ NotifyWARNBorder }),
		NotifyINFOTitle({ NotifyINFOBorder }),
		NotifyDEBUGTitle({ NotifyDEBUGBorder }),
		NotifyTRACETitle({ NotifyTRACEBorder }),
		--

		-- -- Visual Multi.
		-- VM_Extend = { bg = colors.selection_inactive },
		-- VM_Cursor = { bg = colors.selection_inactive, sp = colors.fg, underline = true },
		-- VM_Insert = { sp = colors.fg, underline = true },
		-- VM_Mono = { fg = colors.bg, bg = colors.comment },
		--

		-- hlargs (semantic parameter highlighting)
		Hlargs({ sym("@parameter") }),
		--

		-- virt-column
		VirtColumn({ Whitespace }),
		--

		-- indent blankline
		-- IblScope {},
		RainbowRed({ fg = t.rainbowRed }),
		RainbowYellow({ fg = t.rainbowYellow }),
		RainbowBlue({ fg = t.rainbowBlue }),
		RainbowOrange({ fg = t.rainbowOrange }),
		RainbowGreen({ fg = t.rainbowGreen }),
		RainbowViolet({ fg = t.rainbowViolet }),
		RainbowCyan({ fg = t.rainbowCyan }),

		-- rainbow-delimiter
		RainbowDelimiterRed({ fg = t.rainbowRed }),
		RainbowDelimiterYellow({ fg = t.rainbowYellow }),
		RainbowDelimiterBlue({ fg = t.rainbowBlue }),
		RainbowDelimiterOrange({ fg = t.rainbowOrange }),
		RainbowDelimiterGreen({ fg = t.rainbowGreen }),
		RainbowDelimiterViolet({ fg = t.rainbowViolet }),
		RainbowDelimiterCyan({ fg = t.rainbowCyan }),

		-- snacks.nvim
		-- SnacksNormal { NormalFloat },

		-- snacks.nvim indent
		SnacksIndent({ Whitespace }),
		-- SnacksIndentBlank { Whitespace },
		SnacksIndentScope({ LineNr }),
		-- SnacksIndentChunk { LineNr },
		SnacksIndent1({ fg = t.rainbowRed }),
		SnacksIndent2({ fg = t.rainbowYellow }),
		SnacksIndent3({ fg = t.rainbowBlue }),
		SnacksIndent4({ fg = t.rainbowOrange }),
		SnacksIndent5({ fg = t.rainbowGreen }),
		SnacksIndent6({ fg = t.rainbowViolet }),
		SnacksIndent7({ fg = t.rainbowCyan }),
		SnacksIndent8({ fg = t.rainbowIndigo }),

		-- snacks.nvim notifier
		SnacksNotifierBorderError({ Normal, fg = t.error }),
		SnacksNotifierBorderWarn({ Normal, fg = t.warning }),
		SnacksNotifierBorderInfo({ Normal, fg = t.info }),
		SnacksNotifierBorderDebug({ Normal, fg = t.punctuation }),
		SnacksNotifierBorderTrace({ Normal, fg = t.property }),
		SnacksNotifierIconError({ SnacksNotifierBorderError }),
		SnacksNotifierIconWarn({ SnacksNotifierBorderWarn }),
		SnacksNotifierIconInfo({ SnacksNotifierBorderInfo }),
		SnacksNotifierIconDebug({ SnacksNotifierBorderDebug }),
		SnacksNotifierIconTrace({ SnacksNotifierBorderTrace }),
		SnacksNotifierTitleError({ SnacksNotifierBorderError }),
		SnacksNotifierTitleWarn({ SnacksNotifierBorderWarn }),
		SnacksNotifierTitleInfo({ SnacksNotifierBorderInfo }),
		SnacksNotifierTitleDebug({ SnacksNotifierBorderDebug }),
		SnacksNotifierTitleTrace({ SnacksNotifierBorderTrace }),

		-- snacks.nvim picker
		-- SnacksPicker { NormalFloat },
		SnacksPickerInput({ NormalFloat, blend = 0 }),
		SnacksPickerBorder({ NormalFloat, fg = t.punctuation }),
		SnacksPickerTitle({ NormalFloat, fg = t.punctuation }),
		-- SnacksPickerCursorLine { CursorLine },
		SnacksPickerSelected({ fg = t.primary }),
		SnacksPickerSearch({ Visual }),
		SnacksPickerMatch({ fg = t.keyword }),
		SnacksPickerPrompt({ fg = t.punctuation }),
		SnacksPickerCol({ Number }),
		SnacksPickerRow({ Number }),
		SnacksPickerFile({ fg = t.fg }),
		SnacksPickerDir({ Comment }),
		SnacksPickerBufFlags({ fg = t.primary }),
		SnacksPickerGitStatusAdded({ fg = t.method }),
		SnacksPickerGitStatusModified({ fg = t.keyword }),
		SnacksPickerGitStatusRenamed({ fg = t.keyword }),
		SnacksPickerGitStatusCopied({ fg = t.keyword }),
		SnacksPickerGitStatusUnmerged({ fg = t.number }),
		SnacksPickerGitStatusDeleted({ fg = t.type }),
		SnacksPickerGitStatusIgnored({ fg = t.comment }),
		SnacksPickerGitStatusUntracked({ fg = t.comment }),

		-- Neotest
		NeotestPassed({ fg = t.added }),
		NeotestRunning({ DiagnosticInfo }),
		NeotestSkipped({ DiagnosticWarn }),
		NeotestFailed({ DiagnosticError }),
		NeotestAdapterName({}),
		NeotestBorder({}),
		NeotestDir({ Directory }),
		NeotestExpandMarker({}),
		NeotestFile({ fg = t.tag }),
		NeotestFocused({}),
		NeotestIndent({}),
		NeotestMarked({}),
		NeotestNamespace({}),
		NeotestWinSelect({}),
		NeotestTarget({}),
		NeotestTest({}),
		NeotestUnknown({}),
		NeotestWatching({ fg = t.constant }),

		-- leap
		LeapMatch({ fg = t.keyword, gui = "underline", sp = t.keyword }),
		LeapLabel({ bg = t.keyword, fg = t.bg }),
		LeapBackdrop({ fg = t.shade40 }),

		-- copilot
		CopilotSuggestion({ fg = t.copilot.mix(t.bg, 20) }),
		CopilotAnnotation({ fg = t.copilot.mix(t.primary, 50).mix(t.bg, 30) }),

		-- basic highlighting without treesitter
		--
		-- javascript
		javaScript({ Identifier }),
		javaScriptIdentifier({ Statement }),
		javaScriptFunction({ Statement }),
		javaScriptParens({ Punctuation }),
		javaScriptBraces({ Punctuation }),
		javaScriptNumber({ Number }),
		--

		-- typescript
		typeScriptImport({ Statement }),
		typeScriptExport({ Statement }),
		typeScriptIdentifier({ Statement }),
		typescriptVariable({ Statement }),
		typeScriptFunction({ Statement }),
		typescriptPredefinedType({ fg = t.keyword }),
		typescriptClassStatic({ Statement }),
		typescriptNodeGlobal({ Statement }),
		typescriptExceptions({ Statement }),
		typeScriptParens({ Punctuation }),
		typeScriptBraces({ Punctuation }),
		typescriptTypeBrackets({ Punctuation }),
		typescriptInterfaceTypeParameter({ Punctuation }),
		typescriptConditionalType({ Punctuation }),
		typeScriptNumber({ Number }),
		typeScriptAliasDeclaration({ Type }),
		typeScriptTypeReference({ Type }),
		typeScriptTypeParameter({ Type }),
		typescriptClassName({ Type }),
		typescriptClassHeritage({ Type }),
		typescriptProp({ Property }),
		typescriptOperator({ Operator }),
		typescriptBinaryOp({ Operator }),
		typescriptDocNotation({ fg = t.shade50 }),
		typescriptDocTags({ typescriptDocNotation }),
		--

		-- json
		jsonKeyword({ Property }),
		jsonQuote({ String }),
		jsonBraces({ Punctuation }),
		jsonBraces({ jsonBraces }),
		--

		--html
		htmlTagName({ Tag }),
		htmlSpecialTagName({ Tag }),
		htmlTag({ htmlTagName }),
		htmlEndTag({ htmlTagName }),
		htmlTagN({ htmlTagName }),
		htmlArg({ Special }),
		htmlSpecialChar({ Constant }),
		--

		-- xml
		xmlTag({ Tag }),
		xmlProcessing({ Tag }),
		xmlProcessingDelim({ Tag }),
		xmlDoctypeDecl({ Tag }),
		xmlTagName({ Tag }),
		xmlDoctype({ Statement }),
		xmlAttrib({ Attribute }),
		xmlEqual({ Punctuation }),
		xmlEntityPunct({ Punctuation }),
		xmlEntity({ Constant }),
		xmlCdataStart({ fg = t.label }),
		--

		-- css
		cssProp({ Property }),
		cssBraces({ Punctuation }),
		cssNoise({ Punctuation }),
		cssSelectorOp({ Punctuation }),
		cssSelectorOp2({ Punctuation }),
		cssAttrComma({ Punctuation }),
		cssClassNameDot({ Punctuation }),
		cssFunctionComma({ Punctuation }),
		cssClassName({ Special }),
		cssIdentifier({ Type }),
		cssImportant({ Statement }),
		cssTagName({ Tag }),
		cssUrl({ String, gui = "underline" }),
		cssUnitDecorators({ Constant }),
		--

		-- rust
		rustModPathSep({ Punctuation }),
		rustFoldBraces({ Punctuation }),
		rustBoxPlacementBalance({ Punctuation }),
		rustSigil({ Punctuation }),
		rustStorage({ Statement }),
		--

		-- ruby
		rubyConstant({ Constant }),
		rubyCurlyBlockDelimiter({ Punctuation }),
		rubyInterpolation({ Punctuation }),
		rubyInterpolationDelimiter({ Punctuation }),
		rubyStringDelimiter({ String }),
		rubyKeywordAsMethod({ Function }),
		--

		-- python
		pythonDecorator({ fg = t.label }),
		pythonDecoratorName({ fg = t.label }),
		pythonAttribute({ Property }),
		pythonBuiltin({ fg = t.keyword }),
		--

		-- yaml
		yamlBlockMappingKey({ Property }),
		yamlKeyValueDelimiter({ Punctuation }),
		yamlNodeTag({ Statement }),

		-- ini
		sym("@type.ini")({ Title }),
		dosiniLabel({ Property }),
		dosiniValue({ String }),
		dosiniHeader({ Title }),
		dosiniNumber({ Number }),
		dosiniComment({ Comment }),
		--

		-- markdown
		markdownBoldItalicDelimiter({ Punctuation }),
		markdownUrITitleDelimiter({ Punctuation }),
		markdownOrderedListMarker({ Punctuation }),
		markdownHeadingDelimiter({ Punctuation }),
		markdownStrikeDelimiter({ Punctuation }),
		markdownItalicDelimiter({ Punctuation }),
		markdownIdDeclaration({ Punctuation }),
		markdownCodeDelimiter({ Punctuation }),
		markdownBoldDelimiter({ Punctuation }),
		markdownUrlDelimiter({ Punctuation }),
		markdownLinkTextDelimiter({ Punctuation }),
		markdownLinkDelimiter({ Punctuation }),
		markdownIdDelimiter({ Punctuation }),
		markdownHeadingRule({ Punctuation }),
		markdownH6Delimiter({ Punctuation }),
		markdownH5Delimiter({ Punctuation }),
		markdownH4Delimiter({ Punctuation }),
		markdownH3Delimiter({ Punctuation }),
		markdownH2Delimiter({ Punctuation }),
		markdownH1Delimiter({ Punctuation }),
		markdownListMarker({ Punctuation }),
		-- markdownBoldItalic {},
		markdownBlockquote({ fg = t.constant }),
		markdownUrITitle({}),
		markdownLinkText({ fg = t.constant }),
		markdownFootnoteDefinition({ fg = t.number }),
		markdownFootnote({ fg = t.number }),
		-- markdownStrike {},
		markdownItalic({ Italic, fg = t.parameter }),
		markdownRule({ Keyword }),
		markdownBold({ Bold, fg = t.type }),
		markdownUrl({ fg = t.tag, sp = t.tag, gui = "underline" }),
		markdownLink({ fg = t.tag, sp = t.tag, gui = "underline" }),
		-- markdownAutomaticLink {},
		markdownCode({ fg = t.property }),
		markdownCodeBlock({ fg = t.property }),
		markdownId({ fg = t.method }),
		markdownH6({ fg = t.keyword }),
		markdownH5({ fg = t.keyword }),
		markdownH4({ fg = t.keyword }),
		markdownH3({ fg = t.keyword }),
		markdownH2({ fg = t.keyword }),
		markdownH1({ fg = t.keyword }),

		DebugBreakpoint = { fg = t.keyword },
		DebugBreakpointLine = { fg = t.keyword },
		DebugHighlight = { fg = t.cursor },
		DebugHighlightLine = { fg = t.cursor },

		DapUIScope = { bg = t.keyword, fg = t.bg },
		DapUIType = { fg = t.keyword },
		DapUIDecoration = { fg = t.keyword },
		DapUIModifiedValue = { fg = t.cyan },
		DapUIThread = { fg = t.constant },
		DapUIStoppedThread = { bg = t.constant, fg = t.bg },
		DapUIFloatBorder = { bg = t.bgFloat, fg = t.comment },
		DapUILineNumber = { fg = t.gray or t.comment },
		DapUIFrameName = { fg = t.fg },
		DapUISource = { fg = t.constant },
		DapUIBreakpointsPath = { bg = t.string, fg = t.bg },
		DapUIBreakpointsInfo = { fg = t.fg },
		DapUIBreakpointsCurrentLine = { fg = t.string },
		DapUIBreakpointsLine = { link = "DapUIBreakpointsCurrentLine" },
		DapUIWatchesEmpty = { bg = t.property, fg = t.bg },
		DapUIWatchesValue = { fg = t.property },
		DapUIWatchesError = { fg = t.property },
		debugPC = { fg = t.fg, bg = t.cursor },

		NavicText({ fg = hsl(220, 40, 75) }), -- light grayish blue
		NavicSeparator({ fg = hsl(220, 20, 50) }), -- darker gray

		-- Icon highlights (adjust per preference)
		NavicIconsFile({ fg = t.fg }),
		NavicIconsModule({ fg = t.module }),
		NavicIconsNamespace({ fg = t.module }),
		NavicIconsPackage({ fg = t.module }),
		NavicIconsClass({ fg = t.type }),
		NavicIconsMethod({ fg = t.method }),
		NavicIconsFunction({ fg = t.method }), -- same as method for consistency
		NavicIconsProperty({ fg = t.property }),
		NavicIconsField({ fg = t.property }),
		NavicIconsConstructor({ fg = t.method }),
		NavicIconsEnum({ fg = t.type }),
		NavicIconsInterface({ fg = t.type }),
		NavicIconsVariable({ fg = t.constant }), -- could also use t.fg or t.parameter
		NavicIconsConstant({ fg = t.constant }),
		NavicIconsString({ fg = t.string }),
		NavicIconsNumber({ fg = t.number }),
		NavicIconsBoolean({ fg = t.constant }), -- boolean ≈ constant
		NavicIconsArray({ fg = t.type }), -- array = complex type
		NavicIconsObject({ fg = t.type }),
		NavicIconsKey({ fg = t.attribute }),
		NavicIconsNull({ fg = t.comment }), -- duller look
		NavicIconsEnumMember({ fg = t.constant }),
		NavicIconsStruct({ fg = t.type }),
		NavicIconsEvent({ fg = t.label }),
		NavicIconsOperator({ fg = t.punctuation }),
		NavicIconsTypeParameter({ fg = t.parameter }),
	}
end)
return theme
