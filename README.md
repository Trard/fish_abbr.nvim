# fish_abbr.nvim
A fast plugin which enables fish [abbreviations](https://fishshell.com/docs/current/cmds/abbr.html) in [Neovim](neovim.io).

https://user-images.githubusercontent.com/68790724/198679849-2dc8a4fb-9d42-441f-b058-bb532c954f88.mp4

* Git abbreviations provided by [jhillyerd/plugin-git](https://github.com/jhillyerd/plugin-git)

# Installation
Install the plugin with your package manager of choice.

```lua
-- Packer
use {
  'trard/fish_abbr.nvim',
  config = function() require("fish_abbr").setup() end
}
```

# Update abbreviations
Run to recompile abbreviations
```
:FishAbbrCompile
```
