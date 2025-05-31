
# tinta.nvim

`tinta.nvim` is a clean, dark Neovim colorscheme. Designed for focus and readability and minimal color. Comes with built-in support for transparency and aesthetic.

![image](https://github.com/user-attachments/assets/baca70e7-dba2-43ff-8dc2-80e4466dcf33)

---

### 🧩 Plugin Support

`tinta.nvim` includes consistent highlight groups for many popular Neovim plugins and tools.

Supported / tested integrations:

#### 🛠 UI Enhancements

* [alpha-nvim](https://github.com/goolord/alpha-nvim) – dashboard startup screen
* [nvim-notify](https://github.com/rcarriga/nvim-notify) – elegant notification popups
* [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) – scrollbars with diagnostics
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) – statusline integration
* [barbar.nvim](https://github.com/romgrk/barbar.nvim)
* [nvim-bufferline.lua](https://github.com/akinsho/bufferline.nvim)
* [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

#### 🧠 Code Intelligence

* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [hlargs](https://github.com/m-demare/hlargs.nvim) – highlights function arguments
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) – autocompletion
* [blink.cmp](https://github.com/NvChad/blink-cmp)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)

#### 🔍 Navigation & Search

* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
* [fzf-lua](https://github.com/ibhagwan/fzf-lua)
* [leap.nvim](https://github.com/ggandor/leap.nvim)

#### 🧱 Git Integrations

* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* [neogit](https://github.com/TimUntersberger/neogit)
* [diffview.nvim](https://github.com/sindrets/diffview.nvim)
* [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)

#### 📎 Utilities

* [mason.nvim](https://github.com/williamboman/mason.nvim)
* [trouble.nvim](https://github.com/folke/trouble.nvim)
* [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
* [vim-illuminate](https://github.com/RRethy/vim-illuminate)
* [nvim-cursorword](https://github.com/itchyny/vim-cursorword)
* [which-key.nvim](https://github.com/folke/which-key.nvim)
* [vim-which-key](https://github.com/liuchengxu/vim-which-key)
* [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

---

## 📦 Installation

### lazy.nvim

```lua
{
  "yourusername/tinta.nvim",
  name = "tinta",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme tinta")
  end
}
```
---
### 🔧 Configuration Example

```lua
require("tinta").setup({
  transparent = true,              -- enable transparency
  terminal_colors = true,          -- apply colors to :terminal
})
```

