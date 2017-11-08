# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#export MATLAB_JAVA=/opt/java/jre
#export STEREO_FOLDER="/home/data/UniversityWork/Masters-StereoVision/"
export EDITOR="/usr/bin/vim"
export WINEDLLOVERRIDES='winemenubuilder.exe=d'
#export PYTHONSTARTUP='/home/conf/pystartup'
# Use VirtualEnvWrapper
export VIRTUALFISH_HOME=~/Files/Code/venvs

vt=$(fgconsole 2>/dev/null)
(( vt == 1 )) && exec startx -- vt$vt &> ~/.xlog
unset vt

setxkbmap -option altwin:swap_alt_win

xhost +local:
