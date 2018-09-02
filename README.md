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
### Vim
- `let g:gruvbox_italic = 0`
- Install Go
- Install Linters tools for w0rp/ale (For Go)
- Install Linters tools for w0rp/ale (for other languages)
- Set up YouCompleteMe
- Set up vim-man remaps
- Install `ctags` and `go get -u github.com/jstemmer/gotags` to install tagbar
- Create deus and jellybeans themes for terminator
- Find an easy way to switch themes in vim/terminator
### Others
- Calibre
- https://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash
- Remove Flash
- https://github.com/Diaoul/subliminal
- disable sounds
- map caps lock as a esc
- powertop / tlp
- upgrade vim plugins in run.sh
- append at the end of /etc/sysctl.conf or in /etc/sysctl.d
```
vm.swappiness = 0
fs.inotify.max_user_watches = 524288
```
- fix greeter wallpaper ( perms problem w/Dropbox) (global config of unity-greeter)
`/usr/share/backgrounds/`

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
- Notifications
http://www.webupd8.org/2016/05/customize-notifyosd-notification.html
https://launchpad.net/~leolik/+archive/ubuntu/leolik
`~/.notify-osd`
- install youtube-dl with pip
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
- https://askubuntu.com/questions/361151/disable-auto-mounting
