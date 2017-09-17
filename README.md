# dotfiles

## Description
Sets up my work environment with all my configuration files in only a few minutes

## Quick install command
:warning: Tested only on Ubuntu 16.04 :warning:
```
curl -sSL https://raw.githubusercontent.com/7fELF/dotfiles/master/install.sh | sh
```
or:
```
wget -qO- https://raw.githubusercontent.com/7fELF/dotfiles/master/install.sh | sh
```

## TODO

- disable sounds
- map caps lock as a esc
- https://github.com/munlik/refind-theme-regular
- https://wiki.archlinux.org/index.php/default_applications
- powertop / tlp
- speed up animations
- http://askubuntu.com/questions/294901/how-to-disable-recent-files-folder-in-nautilus
- https://github.com/sjl/badwolf/
- https://en.wikipedia.org/wiki/Swappiness
- append at the end of /etc/sysctl.conf or in /etc/sysctl.d
```
vm.swappiness = 0
fs.inotify.max_user_watches = 524288
```
- fix greeter wallpaper ( perms problem w/Dropbox) (global config of unity-greeter)
/usr/share/backgrounds/
- /usr/share/glib-2.0/schemas/
sudo vim /usr/share/glib-2.0/schemas/10_unity-settings-daemon.gschema.override
```
[com.canonical.unity-greeter]
logo=''
background-logo=''
draw-grid=false
show-hostname=false
play-ready-sound=false
```

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
( https://wiki.ubuntu.com/LightDM  )
- Notifications
http://www.webupd8.org/2016/05/customize-notifyosd-notification.html
https://launchpad.net/~leolik/+archive/ubuntu/leolik
`~/.notify-osd`
- install youtube-dl with pip
- https://github.com/rg3/youtube-dl/blob/master/README.md#configuration
- HOWTO install minimal gnome:
`sudo apt install gnome-session gnome-shell gnome-control-center --no-install-recommends`
- hibernation /etc/polkit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla
```
[Re-enable hibernate by default in upower]
Identity=unix-user:*
Action=org.freedesktop.upower.hibernate
ResultActive=yes

[Re-enable hibernate by default in logind]
Identity=unix-user:*
Action=org.freedesktop.login1.hibernate;org.freedesktop.login1.hibernate-multiple-sessions
ResultActive=yes
```
- .emacs
- apt disable recomends

- firefox.desktop GPU DRI PRIME
```
Exec=env DRI_PRIME=1 firefox %u
```
- fstab
```
# <file system>                                 <mount point>   <type>  <options>                               <dump>  <pass>
UUID=00000000-0000-0000-0000-000000000000       /               ext4    async,discard,noatime,errors=remount-ro	0       1
UUID=00000000-0000-0000-0000-000000000000       /home           ext4    async,discard,noatime,defaults	        0       2
# UUID="8ad2bc34-3998-43fc-bb09-69391833e437"   /var/lib/docker btrfs   defaults	                              0       0
```
