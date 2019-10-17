i3 on Ubuntu
--------------------------------
Tested only on the Ubuntu version I'm currently using (18.04). When a new
LTS version is released, I will most probably swithc to it.

### Installation
Install *minimal version* of Ubuntu 18.04 LTS and run `make install`.

#### Some things will never be automated:
1. Annoying system sounds can be disabled in sound manager.
1. To fix issues with focus in PyCharm with IdeaVim, add
`suppress.focus.stealing=false` to `Help -> Edit Custom Properties...`
1. KeePassXC browser integration settings

#### Optional:
Disable close tab button in Firefox. Add this to
[userChrome.css](https://www.reddit.com/r/firefox/wiki/userchrome).
```
/* Hide all tab Close buttons */
.tabbrowser-tab .tab-close-button { display: none !important; }
```

