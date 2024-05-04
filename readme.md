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
|ExCommand|command|description|options|
|:- |:- |:-:|:-:|
|HanzenInfo|require("hanzen").command.hello()|print("Hello, I am Hanzen!")||
|HanzenReverse|require("hanzen").command.reverse_text()| Rewrite text reversed ||
|HanzenFullToHalf|require("hanzen").command.full_to_half(option)| Selected text full to half|['hiragana','katakana','alphabet', 'number', 'all']|
|HanzenHalfToFull|require("hanzen").command.half_to_full(option)| Selected text half to full|['hiragana','katakana','alphabet', 'number', 'all']|
|HanzenFullToHalfBuffer|require("hanzen").command.full_to_half_buffer()| Selected buffer full to half||
|HanzenHalfToFullBuffer|require("hanzen").command.half_to_full_buffer()| Selected buffer half to full||
<!-- markdownlint-enable MD013 -->

## About

`Hanzen` is made from Japanese words.
In Japanese, "full width charactor" called "Zenkaku Moji", "全角文字".
And, "half width charactor" called "Hankaku Moji", "半角文字".

## Roadmap

- support number
- support alphabet
- support Korean alphabet, Hangul characters
- support whole line selection
