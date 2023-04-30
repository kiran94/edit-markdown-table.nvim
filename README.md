# edit-markdown-table.nvim

[![main](https://github.com/kiran94/edit-markdown-table.nvim/actions/workflows/main.yaml/badge.svg)](https://github.com/kiran94/edit-markdown-table.nvim/actions/workflows/main.yaml)

> Edit Markdown Tables from Neovim

`edit-markdown-table.nvim` is a simple plugin which makes updating markdown tables a breeze, even for tables with lengthy strings. See the [preview](#Preview) for a demo.

## Install 

Using `lazy.nvim`:

```lua
{
    'kiran94/edit-markdown-table.nvim',
    config = function()
        require('edit-markdown-table').setup()
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "EditMarkdownTable",
},
```

### Dependencies 

- Neovim 0.9+
- The [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers) `markdown` parser installed (`:TSInstall markdown`)

### Usage 

Place your cursor on the cell of the markdown table that you want to edit. 

```lua
:lua require('edit-markdown-table').edit_cell() -- or :EditMarkdownTable
```

## Preview 

[![asciicast](https://asciinema.org/a/M2cPbIFc3EpnDctPbRL6Zk3nU.svg)](https://asciinema.org/a/M2cPbIFc3EpnDctPbRL6Zk3nU)

In this example, we are editing this [example](doc/example.md). You can see that especially when `wrap` is turned on, it can be difficult to get a clear view of what you are editing. This plugin simplifies this process by opening a dialog with the text of the current cell so you can make your changes and apply them back to the table.  

*This plugin uses `vim.ui.input` for the input dialog. In this preview, I am using [`dressing.nvim`](https://github.com/stevearc/dressing.nvim) to provide the UI with the following configuration:*

```lua
require("dressing").setup({
    input = {
        enabled = true,
        start_in_insert = false,
        win_options = {
            winblend = 0,
            wrap = true,
        },
    }
})
```
