i3 on Ubuntu
--------------------------------
Master branch is tested only on the Ubuntu version I'm currently 
using on my main computer (18.04 as of writing this).
I use an older version at work and frequently check new releases.
You can find information on how to adapt this repo to a specific 
release in `changelog.md`.

### Installation
Install *minimal version* of (checkbox in the install wizard).
Git is not pre-installed so fix that and then clone this repository
and run `install.sh`.

#### Some things will never be automated:
1. Annoying system sounds can be disabled in sound manager.
1. To fix issues with focus in PyCharm with IdeaVim, add
`suppress.focus.stealing=false` to `Help -> Edit Custom Properties...`
1. KeePassXC browser integration settings
1. [Disable close button in
   Firefox](https://www.reddit.com/r/firefox/comments/7fa3y8/removing_close_tab_button_on_each_tab_in_quantum/)
1. [Nautilus - open in
   terminal](https://askubuntu.com/questions/1030940/nautilus-actions-in-18-04)

#### Optional:
Rainbow Bash: 
```bash
./install-rainbow-bash.sh
```

Git over SSH instead of HTTPS:
```bash
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
```

Specific for my Zenbook UX310UA:
```bash
# Backlight fix:
sudo cp ./xorg.conf /etc/X11/xorg.conf

# Fan speed control (https://github.com/hirschmann/nbfc/wiki/First-steps)
./nbfc.sh
```
