#!/bin/bash

echo "(i)Updating repositories..."
if ! apt-get update
then
echo "[!]The repositories could not be updated. Check your /etc/apt/sources.list"
exit 1
fi
echo "(OK)Update completed successfully!"
echo "(i)Updating packages already installed..."
if ! apt-get dist-upgrade -y
then
echo "[!]Unable to update packages."
exit 1
fi
echo "(OK)Packages update completed successfully!"
if ! apt-get install $1
then
echo "[!]Unable to install $1 package."
exit 1
fi
echo "(OK)Installation completed!"
echo "(i)Starting Google Chrome installation..."
if ! wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
then
echo "[!]Unable to download Google Chrome."
exit 1
fi
echo "(OK)Google Chrome downloaded successfully!"
echo "(i)Starting Google Chrome installation..."
if ! apt install ~/Downloads/google-chrome-stable_current_amd64.deb
then
echo "[!]Unable to install Google Chrome."
exit 1
fi
echo "(OK)Google Chrome succesfully installed"
echo "(i)Starting VSCode download..."
if ! apt install software-properties-common apt-transport-https wget
then
echo "[!]Unable start VSCode download."
exit 1
fi
echo "(OK)First step completed!"
if ! wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
then
echo "[!]Unable to import Microsoft GPG key."
exit 1
fi
echo "(OK)Second step completed!"
if ! add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
then
echo "[!]Unable to activate the VSCode repository."
exit 1
fi
echo "(OK)Third step completed!"
echo "(OK)VSCode downloaded sucessfully!"
echo "(i)Starting VSCode installation..."
if ! apt install code
then
echo "[!]Unable to install VSCode."
exit 1
fi
echo "(OK)VSCode installation was successfull!"
echo "(i)Starting NodeJS installation..."
if ! apt install nodejs
then
echo "[!]Unable to install NodeJS."
exit 1
fi
echo "(OK)NodeJS installation was successfull!"
echo "(i)Starting Yarn installation..."
if ! curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
then
echo "[!]Unable to install Yarn."
exit 1
fi
echo "(OK)First step completed!"
if ! apt-get install yarn
then
echo "[!]Unable to install Yarn."
exit 1
fi
echo "(OK)Yarn installation was successfull!"
echo "(i)Getting ready to install Discord and Spotify..."
if ! apt install snapd
then
echo "[!]Unable to install Snapd."
exit 1
fi
echo "(OK)Snapd installation was successfull!"
echo "(i)Starting Discord installation..."
if ! snap install discord --classic
then
echo "[!]Unable to install Discord."
exit 1
fi
echo "(OK)Discord installation was successfull!"
echo "(i)Starting Spotify installation..."
if ! snap install spotify
then
echo "[!]Unable to install Spotify."
exit 1
fi
echo "(OK)Spotify installation was successfull!"
echo "(OK)Process concluded!"
echo "Pedux: Thank you for used our tool!"
echo "Pedux: Now... GO CODE!!!!!!"
echo "Pedux: See you soon!! :D ;)"
