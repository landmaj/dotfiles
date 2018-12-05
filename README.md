i3 on Ubuntu Mate
--------------------------------
Master branch is tested only on the Ubuntu version I'm currently 
using on my main computer (18.04 as of writing this).
I use an older version at work and frequently check new releases.
You can find information on how to adapt this repo to a specific 
release in `changelog.md`.

### Installation
Install *minimal version* of [Ubuntu Mate](https://ubuntu-mate.org/download/) 
\(checkbox in the install wizard).
Git is not pre-installed so fix that and then clone this repository
and run `install.sh`. A few things have to be done manually when the
scripts finishes \(and preferably after reboot/relog):

#### Still manual but should be automated:
1. i3bar is disabled in the configuration file and I use Mate panel 
    instead, so install this applet to get workspace indicator:
    [mate-i3-applet](https://github.com/city41/mate-i3-applet)
2. I have not figured yet how to move Mate layout/panel configuration,
    so you have to remove unnecessary panel and add aforementioned applet
    manually.

#### Some things will never be automated:
1. Annoying system sounds can be disabled in sound manager.
2. To fix issues with focus in PyCharm with IdeaVim, add
`suppress.focus.stealing=false` to `Help -> Edit Custom Properties...`
3. Configure spellchecking in Firefox.
4. Keyboard shortcuts (lock screen, Mod+f#)
5. KeePassXC browser integration settings
6. GPU drivers on PC

##### Optional \(may break your system):
```
Rainbow Bash:
./install-rainbow-bash.sh
```

Fan speed control:
```
NBFC
./nbfc.sh
https://github.com/hirschmann/nbfc/wiki/First-steps
```

Mainline kernel:
```
https://github.com/GM-Script-Writer-62850/Ubuntu-Mainline-Kernel-Updater
```
