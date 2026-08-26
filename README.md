<div align="center">
  <h1>sddm-wired-theme</h1>
    <a href="https://github.com/ioresolution/sddm-wired-theme">
    <img src="https://github.com/ioresolution/sddm-wired-theme/blob/master/WiredLogin.gif" alt="Logo" width="200" height="200">
  </a>
	<p>Lets all love lain</p>

</div>

## About 

[https://fauux.neocities.org](https://fauux.neocities.org) inspired sddm theme. <br><br>
It does very bare minimum. Just login.

### Whats new?

- login sound
- looping background music 
- added background

all acquired from fauux's login page.

## Installation

- `git clone https://github.com/faisalhsn/sddm-wired-theme`
- copy directory to  `/usr/share/sddm/themes/` using `sudo cp -r sddm-wired-theme /usr/share/sddm/themes/`
- install ```sddm``` ```qt5-multimedia```  ```qt5-quickcontrols``` ````noto-fonts````
- set sddm as your current login manager ```systemctl enable sddm && systemctl start sddm```

on Debian (or based distros) you can install these components using:

```
sudo apt install --no-install-recommends qml-module-qtquick-controls sddm fonts-noto #sddm comes with plasma-desktop; hence this flag
```

## Usage
Open up your configuration file `/etc/sddm.conf` and set `sddm-wired-theme` as your current theme

```shell
[Theme]
# Current theme name
Current=sddm-wired-theme
``` 

![](https://github.com/ioresolution/sddm-wired-theme/blob/master/Preview.png)
