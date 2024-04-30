# Hanzen.nvim

This is Rewriter of between Full width charactor and Half width charactor.

## Install

### Lazy.nvim

```lua
{
    "ShortArrow/hanzen.nvim",
    config = function()
      require("hanzen").setup()
    end,
}
```

## Keymap

Default keymaps are nothing.

## Command

|command|description|
|:- |:-:|
|require("hanzen").command.hello()|print("Hello, I am Hanzen!")|
|require("hanzen").command.reverse_text()| Rewrite text reversed |
|require("hanzen").command.katakana.full_to_half()| Selected text full to half only katakana|

## Roadmap

- number
- alphabet
