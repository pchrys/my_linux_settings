#!/bin/bash

if [ $# -lt 1 ]; then
  echo ""
  echo " ========================ATTENTION ==========================="
  echo " Please run this script at the location wherer it is located;"
  echo " otherwise it will not work properly. "
  echo " ============================================================="
  echo ""

  echo " Usage : $0 <backup/update>"
  echo " <backup> to backup settings"
  echo " <update> to update settings"
  exit 1
fi

if [ "$1" == "backup" ]; then

src="$HOME"
dst="$PWD"

echo "backup settings ... "

cmd="rsync -arvpP ${src}/.bashrc ${dst}"
echo "run cmd: $cmd"
eval $cmd

cmd="rsync -arvpP ${src}/.tmux.conf ${dst}"
echo "run cmd: $cmd"
eval $cmd


cmd="rsync -arvpP ${src}/.gitconfig ${dst}"
echo "run cmd: $cmd"
eval $cmd

#cmd="rsync -arvpP ${src}/.emacs.d  ${dst}"
## only back up packages and setting files
#cmd="rsync -arvpP --include='.emacs.d/' --include='elpa/***' --include='third-party/***' --exclude='*' ${src}/.emacs.d  ${dst}"
cmd="rsync -arvpP  --exclude='*.elc' --include='.emacs.d/' --include='elpa/***' --include='third-party/***' --exclude='*' ${src}/.emacs.d  ${dst}"
echo "run cmd: $cmd"
eval $cmd


cmd="rsync -arvpP ${src}/.emacs  ${dst}"
echo "run cmd: $cmd"
eval $cmd

cmd="rsync -arvpP ${src}/.vimrc  ${dst}"
echo "run cmd: $cmd"
eval $cmd

cmd="rsync -arvpP --exclude="YouCompleteMe" ${src}/.vim  ${dst}"
echo "run cmd: $cmd"
eval $cmd

elif [ "$1" == "update" ]; then 

  #src="$HOME/work/my_linux_settings"
  #dst="$HOME/tmp"
  src="$PWD"
  dst="$HOME"

  echo "src: $src"
  echo "dst: $dst"

  echo "update settings ... "

  cmd="rsync -arvpP ${src}/.bashrc ${dst}"
  echo "run cmd: $cmd"
  #eval $cmd

  cmd="rsync -arvpP ${src}/.tmux.conf ${dst}"
  echo "run cmd: $cmd"
  #eval $cmd


  cmd="rsync -arvpP ${src}/.gitconfig ${dst}"
  echo "run cmd: $cmd"
  #eval $cmd

  ##cmd="rsync -arvpP ${src}/.emacs.d  ${dst}"
  ### only update packages and setting files
  #cmd="rsync -arvpP --include='.emacs.d/' --include='elpa/***' --include='third-party/***' --exclude='*' ${src}/.emacs.d  ${dst}"
  cmd="rsync -arvpP --exclude='*.elc' --include='.emacs.d/' --include='elpa/***' --include='third-party/***' --exclude='*' ${src}/.emacs.d  ${dst}"
  echo "run cmd: $cmd"
  eval $cmd


  cmd="rsync -arvpP ${src}/.emacs  ${dst}"
  echo "run cmd: $cmd"
  eval $cmd

  cmd="rsync -arvpP ${src}/.vimrc  ${dst}"
  echo "run cmd: $cmd"
  eval $cmd

  cmd="rsync -arvpP ${src}/.vim  ${dst}"
  echo "run cmd: $cmd"
  eval $cmd
 
else
  echo "wrong input argument. Exiting ..."
  exit 1
fi





### 

###   echo "# my_linux_settings" >> README.md
###   git init
###   git add README.md
###   git commit -m "first commit"
###   git remote add origin https://github.com/pchrys/my_linux_settings.git
###   git push -u origin master

