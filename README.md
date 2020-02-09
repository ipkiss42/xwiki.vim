## Overview

`xwiki.vim` is a Vim plugin providing support for the [XWiki](https://www.xwiki.org/) language (i.e. what you get in the XWiki source editor).

Features:
* Syntax highlighting of most XWiki constructs
* Syntax highlighting of other filetypes inside code blocks (`{{code language="foo"}} ... {{/code}}`)
    * Note that new filetypes added interactively will not be highlighted. You can address that by running `:setf xwiki` manually.
* Syntax highlighting inside the `{{formula}}` macro
* Syntax highlighting inside the `{{plantUML}}` macro (relies on an external plugin)
* Folding by section
* Include tests for many edge cases to avoid future regressions

## Installation

Install using your favorite plugin manager. Example with [NeoBundle](https://github.com/Shougo/neobundle.vim):

```vim
" Define any options before loading the plugin
"let g:xwiki_filetype_highlighting = 1
NeoBundle 'ipkiss42/xwiki.vim.git'
```

If you want syntax highlighting with the `{{plantUML}}` macro, also install the [aklt/plantuml-syntax](https://github.com/aklt/plantuml-syntax) plugin.

To test that things are working, open the `tests/basic.xwiki` file with Vim: this should give you an overview of the capabilities.

## Usage

The plugin will load automatically if you open a file with the `.xwiki` extension.

If you have XWiki contents in a buffer (e.g. copy-pasted from the XWiki source editor), you can force the filetype using this command:

```vim
:setf xwiki
```

The same command can be used to highlight filetypes within a `{{code language="..."}}` block that you have added to the buffer.

## Options

There are a few configuration options that you can use to tweak the behavior.
See `ftplugin/xwiki.vim` for details.

## Future improvements

Here are some ideas for future improvements:
* Fix the `FIXME`s in `tests/basic.xwiki`

Contributions are welcome!

## License

This code is/will be covered by the MIT license.

