Mac OS X
--------
Tested on 

### Installation
Install Mac OS X and run `make install`.

### Unavailable on Homebrew:
 - [Sonos](https://support.sonos.com/s/downloads?language=en_US)
 - [SteelSeries Exact Mouse](https://downloads.steelseriescdn.com/drivers/tools/steelseries-exactmouse-tool.dmg)


### 2k display on M1
There is no support for HiDPI on 2k displays on macOS and the usual hacks from Intel hardware do not work. 
[The only workaround I found:](https://forums.macrumors.com/threads/scale-1680x1050-on-rmb-without-an-app.1873910/page-17?post=29863160#post-29863160)

    1. Install SwitchResX
    2. Disconnect external display
    3. Add custom resolution for build-in screen and set it to:
        - 4096x2304
        - 3840x2160 (looks kinda blurry on a 25" display)
    4. Reboot
    5. Choose the desired resolution on the internal display
    6. Enable screen mirroring.
    7. Do not close the lid or you will be back to 2560x1440
