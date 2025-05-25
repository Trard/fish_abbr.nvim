# fish_abbr.nvim
A fast and lightweight plugin that enables fish [abbreviations](https://fishshell.com/docs/current/cmds/abbr.html) in [Neovim](neovim.io).

https://user-images.githubusercontent.com/68790724/198679849-2dc8a4fb-9d42-441f-b058-bb532c954f88.mp4

* Git abbreviations provided by [jhillyerd/plugin-git](https://github.com/jhillyerd/plugin-git)

# Installation
Install the plugin with a package manager of your choice.

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use('trard/fish_abbr.nvim')
```

Using [vim-plug](https://github.com/junegunn/vim-plug)
```lua
Plug 'trard/fish_abbr.nvim'
```

# Update abbreviations
Run to recompile abbreviations
```
:FishAbbrCompile
```
