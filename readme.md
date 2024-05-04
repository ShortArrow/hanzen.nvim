# Hanzen.nvim

This is Rewriter of between Full width charactor and Half width charactor.

👷 🚧 WIP 🚧 👷

***This Project is work in progress yet.***

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

<!-- markdownlint-disable MD013 -->
|ExCommand|command|description|
|:- |:- |:-:|
|HanzenInfo|require("hanzen").command.hello()|print("Hello, I am Hanzen!")|
|HanzenReverse|require("hanzen").command.reverse_text()| Rewrite text reversed |
|HanzenKatakanaF2H|require("hanzen").command.katakana.full_to_half()| Selected text full to half only katakana|
|HanzenKatakanaH2F|require("hanzen").command.katakana.half_to_full()| Selected text half to full only katakana|
<!-- markdownlint-enable MD013 -->

## About

`Hanzen` is made from Japanese words.
In Japanese, "full width charactor" called "Zenkaku Moji", "全角文字".
And, "half width charactor" called "Hankaku Moji", "半角文字".

## Roadmap

- number
- alphabet
