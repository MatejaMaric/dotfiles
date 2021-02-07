# About this project

Configuration files for programs I use and used to use, including some helper scripts.

## Configuration files for programs I currently use:

- bash
- qtile
- termite
- dunst
- nvim
- zathura
- mpd
- ncmpcpp
- newsboat

## Configuration files for programs I used:

- i3
- polybar
- xmonad
- xmobar

## Helper scripts:

- mpd_show.sh: Show currently playing song in pop-up.
- unmount_usb.sh: Unmount currently mounted USB drive or one selected from list of currently mounted USB drives.
- save_notification.sh: Save notifications to `/tmp/notifications`.

## Note on Neovim!

Neovim is the only program that requires some manual intervention on your part when using my dotfiles.

- When you enter Neovim for the first time you need to run `:PlugInstall` to install plug-ins that I use.
- If you are going to use `coc-phpactor` CoC extension, besides manually installing Phpactor, you need to go to `.config/nvim/coc-settings.json` and set `phpactor.path` variable.
