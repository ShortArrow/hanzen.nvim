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

## About

`Hanzen` is made from Japanese words.
In Japanese, "full width charactor" called "Zenkaku Moji", "全角文字".
And, "half width charactor" called "Hankaku Moji", "半角文字".

## Roadmap

- number
- alphabet
