# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "/home/scripts" ] ; then
    PATH="/home/scripts:$PATH"
fi

#export MATLAB_JAVA=/opt/java/jre

export STEREO_FOLDER="/home/data/UniversityWork/Masters-StereoVision/"
export EDITOR="/usr/bin/vim"
export WINEDLLOVERRIDES='winemenubuilder.exe=d'

export PYTHONSTARTUP='/home/conf/pystartup'

# Use VirtualEnvWrapper
export WORKON_HOME=/home/data/Coding/python-virtualenvs

vt=$(fgconsole 2>/dev/null)
(( vt == 1 )) && exec startx -- vt$vt &> ~/.xlog
unset vt

xmodmap -e "keysym Menu = Super_R"

xhost +local:
