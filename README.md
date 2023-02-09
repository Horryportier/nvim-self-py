# nvim-self-py
---
auto completes __init__ function in python bc its a pain 

## Install: 

Using ![vim-plug](https://github.com/junegunn/vim-plug)

```vim 
Plug 'Horryportier/nvim-self-py'
```

Using ![dein](https://github.com/Shougo/dein.vim)

```vim 
call dein#add('Horryportier/nvim-self-py')
```

Using ![packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'Horryportier/nvim-self-py'
```
---

## How To Use: 

Put this in your ``` init.lua ``` or, in ``` lua EOF ``` portion of your ``` init.vim ```.

```lua 
require("nvim-self-py").setup("Self")
```
