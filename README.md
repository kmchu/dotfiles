# dotfiles
Personal configuration files for MacOS.

## Installation
1. Setup ssh access to this repo
1. Copy `.bin/install.sh` onto local system
1. Run script
1. Install `bash-completion` with `brew`

## Update VIM plugins
1. Open NeoVim
1. Run `:PlugInstall`
1. Optionally, you can update plugins using `:PlugUpdate`

## Update tmux plugins
1. Press prefix + I (capital i, as in Install) to fetch the plugin.

## 2025-05-04 Oddity
Marksman completion wasn't working because of [this setting](https://github.com/artempyanykh/marksman/issues/204#issuecomment-1546615580), which assumes one title per document by default. For some reason this also breaks sub-header linking. The fix is simply to turn this setting off by adding a marksman config file `.marksman.toml` to the project (ref. [Marksman titles from headings](https://github.com/artempyanykh/marksman/blob/main/docs/features.md#titles-from-headings)):

```
[core]
title_from_heading = false
```

Also note that [this](https://github.com/kmchu/dotfiles/issues/1) is now an issue due to competing `omnifunc` settings. 

## 2023-12-30 Oddity
vim-pandoc and vim-pandoc-syntax are written in python and therefore require access to python3. This was installed on my macOS machine using brew, but the plugins were unable to operate correctly (and produced an empty result instead of an error!). I ran this in EX mode to test:

```
:python3 import sys; print(sys.version)
```

Which produced an error akin to "python3 not recognized". I was able to fix this using this [command](https://stackoverflow.com/a/67147150):

```bash
pip3 install --user --upgrade neovim
```

Also avoid having both plugins and LSP manage the same filetypes.

## Resources
- [Guide for this dotfile management technique](https://www.atlassian.com/git/tutorials/dotfiles)
- [Dotfiles associated with above guide author](https://bitbucket.org/durdn/cfg/src/master/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [The Ultimate Git Alias Setup](https://gist.github.com/mwhite/6887990)
- [bash-completion](https://github.com/scop/bash-completion)
