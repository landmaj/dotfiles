**Here are any major  changes you have to do if you want to use an older version of Ubuntu.**

18.10
-----
Minimal install of Ubuntu Mate 18.10 is broken right now \(21.10.18), at least if you use LVM. 
`apt autoremove` lists `lvm2` \(and a lot of other packages) as safe to remove.
If you run this command, your system will not boot again.
I went back to 18.04.

18.04
-----
* Bluez 5.48 is bugged. Install 5.50 or newer.

16.10, 17.04, 17.10
-----
I have not used those versions.

16.04
-----
* Rofi from Ubuntu repository is ancient and themes will not work. Install at least 1.5.0 from Ubuntu 18.04.
* i3 is available but it's an old version that has some problems. Use official repository from i3 authors.
* Vifm is too old and configuration file from this repository will cause errors. Install at least version 0.9 from Ubuntu 18.04.