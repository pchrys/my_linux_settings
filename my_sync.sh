#!/bin/bash

rsync -arvpP ~/.emacs.d  ~/work/my_linux_settings
rsync -arvpP ~/.emacs  ~/work/my_linux_settings
rsync -arvpP ~/.vimrc  ~/work/my_linux_settings
rsync -arvpP --exclude="YouCompleteMe" ~/.vim  ~/work/my_linux_settings

rsync -arvpP ~/.bashrc ~/work/my_linux_settings
rsync -arvpP ~/.tmux.conf ~/work/my_linux_settings
rsync -arvpP ~/.gitconfig ~/work/my_linux_settings

### 

###   echo "# my_linux_settings" >> README.md
###   git init
###   git add README.md
###   git commit -m "first commit"
###   git remote add origin https://github.com/pchrys/my_linux_settings.git
###   git push -u origin master

