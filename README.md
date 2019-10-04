# dotenv
my dotenv files

## Install with menu.sh
```
sudo apt update && git clone --recurse-submodules https://github.com/JoshGore/dotenv .env && cd .env && ./menu.sh
```
then either select individual options or default WSL option

## Install with install.sh (deprecated)

```
sudo apt-get update
git clone --recurse-submodules https://github.com/JoshuaGore8/dotenv .env
cd .env
./install.sh
```
Or in a one-liner
```
sudo apt-get update && git clone --recurse-submodules https://github.com/JoshuaGore8/dotenv .env && cd .env && ./install.sh
```
*options to install*
* *zsh and config*
* *terminator (with required steps for WSL)*
* *recursive installation of github repo*
* *oh-my-zsh*
* *vimplug and other vim config*
* *LastPass*
* *SSH Keys*
## Variables set in .profile, .zshrc, .bashrc etc.
### setup display manager
```
export DISPLAY=:0
```
### Setup Docker Host Link
```
export DOCKER_HOST=tcp://0.0.0.0:2375
```
### Windows Path
```
export PATH="$PATH:/mnt/c/Program\ Files/Docker/Docker/resources/bin"
```
### Config file options
cd to home directory at start of .zshrc
need to install dbus-launch first
```
sudo apt install dbux-x11
sudo dbus-uuidgen --ensure
```
```
# Start dbus (for wsl)
dbus-launch
# if commiting remove from zshrc
if [ -t 1  ]; then  
cd ~
fi  
```

## WSL tips, tricks
### Creating Shortcuts
Create startTilixTerm.vbs with:
```
args = "-c" & " -l " & """DISPLAY=:0 tilix"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0
```
And a windows shortcut with
Target:
```
C:\Windows\System32\wscript.exe G:\Desktop\startTilixTerm.vbs
```
and Start in:
```
%USERPROFILE%
```
## Troubleshooting
vte error and can't update settings? Install dbus-x11
## Handy Links
### WSL
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
https://blog.ropnop.com/configuring-a-pretty-and-usable-terminal-emulator-for-wsl/
https://github.com/sirredbeard/Awesome-WSL
