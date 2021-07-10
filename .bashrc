#!/bin/sh

### after install cygwin, ssh, sshd , then run the following command,
# ssh-host-config -y # enable sshd. "-y" answers yes to all queries.
# cygrunsrv --start sshd # start it as an autostart Windows service

# ssh localhost # try to recursively log in via ssh

# in putty, do the following set up
# a.  hostname:  localhost
# b. port: 22


set -o vi
export EDITOR=vim
#set -o emacs

###command history
export HISTSIZE=5000
export HISTFILESIZE=5000


alias r="cd ~/work/research"    #research directory
alias w="cd ~/work"
alias ls="ls --color"
alias tm="tmux"
alias gl="cd /cygdrive/e/navico/other/openGL"
alias wd="cd /data/hdd1/data/shaobo/win10Data/shaobo/work"
alias ll="ls -al --color=never"


export LD_LIBRARY_PATH=/usr/local/lib/:$LD_LIBRARY_PATH
export PATH=~/work/bin:$PATH


###web server related setup
export PATH=/usr/local/web/jdk1.8.0_25/bin:$PATH
export JAVA_HOME=/usr/local/web/jdk1.8.0_25

export CATALINA=/usr/local/web/tomcat
export CLASSPATH=$CATALINA/lib/servlet-api.jar:$CLASSPATH

### pkg-config
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig


#### okular for viewing pdf, 

#export PS1="\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$"


#export PS1="\[\e[34;1m\] \u@\[\e[32;1m\]\H> \W \[\e[0m\]"
#//export PS1="\e[32;1m\u@\H > \e[0m"


#export TERM=xterm-color
export TERM=xterm-256color

#if [ "$TERM" = "linux" ]
#then
	#we're on the system console or maybe telnetting in
	#export PS1="\[\e[32;1m\] \u@\H > \[\e[0m\]"
	#//export PS1="\e[32;1m\u@\H > \$ \e[0m"
#else
	#we're not on the console, assume an xterm
	#export PS1="\[\e]2;\u@\H \w\a  \e[32;1m\]>\[\e[0m\] " 
	#//export PS1="\[\e]2;\u@\H \w\a\e[34;2m\] \u@\[\e[34;2m\]\H> \W \$ \[\e[0m\]" 
	#export PS1="\[\e]2;\u@\H \w\a\[\e[32;1m\]\u@\[\e[32;1m\]\H> \W \[\e[34;1m\]" 
#fi

###"\e]2;titlebar\a"
export PS1="\[\e]2;\u@\H:\w\a\e[34;2m\]\u@\H> \W \$ \[\e[0m\]" 

#export PS1="\e]2;\u@\H \w\a ---> this part goes to title   \[\e[34;2m\]\u@\H> \W \$ \[\e[0m\] this part goes to prompt" 



#export LS_COLORS=$LS_COLORS:"no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:"

export LS_COLORS=$LS_COLORS:"no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:"

export PATH=$PATH:/usr/sbin

### start sshd daemon
# /usr/sbin/sshd -d  &

### set up for latex
#export TEXINPUTS=".:~/latex:"
export TEXINPUTS=$TEXINPUTS:~/.texmf/tex/latex/local/

export PYTHONPATH=/home/shaobo/work/AI/cs231/assignments/assignment1/cs231n:$PYTHONPATH

###change qtcreator font size
## export QT_SCALE_FACTOR=1.5

#export QT_QPA_PLATFORM_PLUGIN_PATH=/home/shaobo/work/qt/5.15.0/gcc_64/plugins/platforms

export export PATH=/usr/local/gcc-10.2.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/gcc-10.2.0/lib64:$LD_LIBRARY_PATH




