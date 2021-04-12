# About this project

Configuration files for programs I use and used to use, including some helper scripts.

## Configuration files for programs I currently use:

- bash
- dunst
- mpd
- ncmpcpp
- newsboat
- nvim
- qtile
- rofi
- termite
- zathura
- tmux

## Configuration files for programs I used:

- i3
- polybar
- xmobar
- xmonad

## Helper scripts:

- get_password.sh: Select password (from `pass`) to copy to clipboard.
- mpd_show.sh: Show currently playing song in pop-up.
- save_notification.sh: Save notifications to `/tmp/notifications`.
- unmount_usb.sh: Unmount currently mounted USB drive or one selected from list of currently mounted USB drives.

## Note on Neovim!

Neovim is the only program that requires some manual intervention on your part when using my dotfiles.

- When you enter Neovim for the first time you need to run `:PlugInstall` to install plug-ins that I use.
- If you are going to use `coc-phpactor` CoC extension, besides manually installing Phpactor, you need to go to `.config/nvim/coc-settings.json` and set `phpactor.path` variable.
