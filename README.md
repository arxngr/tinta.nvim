
# tinta.nvim

`tinta.nvim` is a clean, dark Neovim colorscheme. Designed for focus and readability and minimal color. Comes with built-in support for transparency and aesthetic.

### tinta
<img width="3840" height="1991" alt="image" src="https://github.com/user-attachments/assets/a18aa95d-14d5-4d26-bd78-86834109fef5" />


### tinta-darker
<img width="3840" height="1991" alt="image" src="https://github.com/user-attachments/assets/a8003aec-c66a-4b9e-81e6-cf7455f2f6fc" />



---

## 📦 Installation

### lazy.nvim

```lua
{
"arxngr/tinta.nvim",
lazy = false,
priority = 1000,
config = function()
    require("tinta").setup({ palette = "tinta-darker", guicursor = false })
end,
}

```
---
### 🔧 Configuration Example

```lua
require("tinta").setup({
  transparent = true,              -- enable transparency
  palette = "tinta" -- "tinta", "tinta-darker"
})
```

