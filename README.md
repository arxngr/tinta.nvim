

# 🎨 tinta.nvim

 A modern and minimal mid-high contrast Neovim colorscheme, handcrafted for a balanced, beautiful, and focused coding experience.

`tinta.nvim` is a Lua-based Neovim theme built with [lush.nvim](https://github.com/rktjmp/lush.nvim), offering a clean and carefully tuned aesthetic for both daily work and long coding sessions.

---

![screenshot](https://raw.githubusercontent.com/ardi-nugraha/tinta.nvim/main/assets/tinta-preview.png)

## ✨ Features

- 🌗 Subtle and legible color palette
- 💡 LSP and Treesitter support
- 🪄 Transparent background support
- 🌈 Rainbow heading support for Markdown and markup files
- 🧩 Plugin integrations:
  - `bufferline.nvim`
  - `nvim-tree.lua`
  - `trouble.nvim`
- 🧱 Built using `lush.nvim` for seamless extensibility

---

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "ardi-nugraha/tinta.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tinta").setup({
      transparent = false,       -- Set true if you want transparent background
      rainbow_headings = true,   -- Enable rainbow colors for headings
    })
    vim.cmd.colorscheme("tinta")
  end
}


### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use({
  "ardi-nugraha/tinta.nvim",
  config = function()
    require("tinta").setup({
      transparent = false,
      rainbow_headings = true,
    })
    vim.cmd.colorscheme("tinta")
  end
})
```

---

## ⚙️ Configuration

`tinta.nvim` exposes a simple setup function:

```lua
require("tinta").setup({
  transparent = true,       -- Optional: remove background for transparency
  rainbow_headings = true,  -- Optional: color headings in markdown/org
})
```

---

## 🧪 Requirements

* Neovim 0.7+
* [lush.nvim](https://github.com/rktjmp/lush.nvim)

Make sure `lush.nvim` is installed (it will be automatically pulled if you're using `lazy.nvim`).

---

## 📂 File Structure

```bash
tinta.nvim/
├── colors/
│   └── tinta.lua          # Entry point for the theme
├── lua/tinta/
│   ├── init.lua           # Theme loader and logic
│   └── highlights.lua     # Theme definitions using lush
```

---

## 📸 Screenshots


![screenshot](https://github.com/user-attachments/assets/a8716648-8521-4d33-a3d3-406e19b26b35)

---

## 📄 License

MIT © [ardi-nugraha](https://github.com/ardi-nugraha)

---

## 🙏 Acknowledgements

* Inspired by [`bluloco`](https://github.com/uloco/bluloco.nvim) and [`rose-pine`](https://github.com/rose-pine/neovim)
* Built with the awesome [lush.nvim](https://github.com/rktjmp/lush.nvim)

---

Happy coding! 🖤


