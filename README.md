# dotenv
my dotenv files

## Install with menu.sh
```
sudo apt-get update
git clone --recurse-submodules https://github.com/JoshuaGore8/dotenv .env
cd .env
./menu.sh
```
Or in a one-liner
```
sudo apt-get update && git clone --recurse-submodules https://github.com/JoshuaGore8/dotenv .env && cd .env && ./menu.sh
```

## Install with install.sh deprecated?

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
## Docker install has option to set a link to local host docker server for windows docker on WSL
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
## Handy Links
### WSL
https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
https://blog.ropnop.com/configuring-a-pretty-and-usable-terminal-emulator-for-wsl/
