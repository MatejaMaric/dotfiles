import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "st -e tmux"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.local/bin/autostart.sh')
    subprocess.call([home])


keys = [
    # Audio
    Key([mod], "h", lazy.spawn("amixer -q sset Master 1%+"),
        desc="Increase volume"),
    Key([mod], "n", lazy.spawn("amixer -q sset Master 1%-"),
        desc="Decrease volume"),
    Key([mod], "m", lazy.spawn("amixer -q sset Master toggle"),
        desc="Toggle mute"),

    # Programs...
    Key([mod], "e", lazy.spawn("bash -c ~/.local/bin/unmount_usb.sh"),
        desc="Eject USB"),
    Key([mod, "control"], "p", lazy.spawn("scrot -ze 'mv $f ~/stuff/pictures/screenshots/'"),
        desc="Take a screenshot"),
    Key([mod], "x", lazy.spawn("mpc toggle"),
        desc="Pause/Resume MPD playback"),
    Key([mod, "shift"], "x", lazy.spawn("bash -c ~/.local/bin/mpd_show.sh"),
        desc="Display song."),
    Key([mod], "z", lazy.spawn("mpc next"),
        desc="MPD next song"),
    Key([mod, "shift"], "z", lazy.spawn("mpc prev"),
        desc="MPD previous song"),

    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(),
        desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(),
        desc="Move focus up in stack pane"),

    # Move windows up or down in current stack
    Key([mod, "shift"], "k", lazy.layout.shuffle_down(),
        desc="Move window down in current stack "),
    Key([mod, "shift"], "j", lazy.layout.shuffle_up(),
        desc="Move window up in current stack "),

    # Change window size
    Key([mod], "g", lazy.layout.grow(),
        desc="Grow window size."),
    Key([mod], "v", lazy.layout.shrink(),
        desc="Decrease window size."),
    Key([mod], "c", lazy.layout.normalize(),
        desc="Return to normal sizing."),

    # Floating
    Key([mod], "t", lazy.window.toggle_floating(),
        desc="Toggle floating"),

    # Keyboard layout
    Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout."),

    # Switch window focus to other pane(s) of stack
    # Key([mod], "space", lazy.layout.next(),
    # desc="Switch window focus to other pane(s) of stack"),

    # Swap panes of split stack
    # Key([mod, "shift"], "space", lazy.layout.rotate(),
    # desc="Swap panes of split stack"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
    # desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),

    Key([mod], "r", lazy.spawn("rofi -show run"),
        desc="Use Rofi to start a new program."),

    Key([mod], "b", lazy.screen.toggle_group(),
        desc="Switch to the previously active group."),
]

groups = [Group(i) for i in "asdfuiop"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(toggle=False),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=False),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    # layout.Tile(),
    layout.MonadTall(border_focus='81a1ca', margin=8),
    layout.MonadWide(border_focus='81a1ca', margin=8),
    layout.Max(border_focus='81a1ca'),
    layout.Floating(border_focus='81a1ca'),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(disable_drag=True),
                widget.Prompt(),
                widget.CurrentLayout(),
                widget.WindowName(),

                widget.Spacer(length=10),

                # widget.Chord(
                #     chords_colors={
                #         'launch': ("#ff0000", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),

                # widget.CapsNumLockIndicator(),
                # widget.Maildir(maildir_path='~/.mail'),

                widget.KeyboardLayout(
                    configured_keyboards=[
                        'us', 'rs alternatequotes', 'rs latin'],
                    display_map={'us': 'english',
                                 'rs alternatequotes': 'serbian cyrillic',
                                 'rs latin': 'serbian latin'
                                 },
                    option='caps:swapescape'
                ),

                #   墳 婢
                widget.TextBox(text=" 墳"),
                widget.Volume(),
                widget.Clock(format='%A %d %b %I:%M %p'),
                widget.Systray(),
            ],
            24,
            opacity=0.85,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[

    {'wmclass': 'pinentry-gtk-2'},

    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry

    # {'wmclass': 'confirmreset'},  # gitk
    # {'wmclass': 'makebranch'},  # gitk
    # {'wmclass': 'maketag'},  # gitk
    # {'wmclass': 'ssh-askpass'},  # ssh-askpass
    # {'wname': 'branchdialog'},  # gitk
    # {'wname': 'pinentry'},  # GPG key password entry

    # {'wmclass': 'confirm'},
    # {'wmclass': 'dialog'},
    # {'wmclass': 'download'},
    # {'wmclass': 'error'},
    # {'wmclass': 'file_progress'},
    # {'wmclass': 'notification'},
    # {'wmclass': 'splash'},
    # {'wmclass': 'toolbar'},

    # {'wmclass': 'gcr-prompter'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
