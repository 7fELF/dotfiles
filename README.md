# dotfiles

## Description
Sets up my work environment with all my configuration files in only a few minutes

## Quick install command
:warning: Do not run this unless you understand what it does  :warning:
```
curl -sSL https://raw.githubusercontent.com/7fELF/dotfiles/master/install.sh | sh
```

## TODO
### Vim
- `let g:gruvbox_italic = 0`
- Install Linters tools for w0rp/ale (For Go)
- Install Linters tools for w0rp/ale (for other languages)
- Set up YouCompleteMe
- Install `ctags` and `go get -u github.com/jstemmer/gotags` to install tagbar
### Others
- Install Go
- Install Docker
- Calibre
- https://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash
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
- /usr/share/glib-2.0/schemas/
```
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
```
- install youtube-dl with pip
- install hstr
- https://askubuntu.com/questions/1195373/how-do-i-apply-settings-for-the-login-screen
- sudo cp ~/.config/monitors.xml ~gdm/.config/monitors.xml
- install sleep.conf file
- fix cracling audio (further test required, might not work)
  in /etc/pulse/default.pa
  -load-module module-udev-detect
  +load-module module-udev-detect tsched=0
