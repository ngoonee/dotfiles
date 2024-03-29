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
# For spotify-dl
export SPOTIFY_CLIENT_ID='598fa0989e1d4087a4367e54c01241c0'
export SPOTIFY_CLIENT_SECRET='598fa0989e1d4087a4367e54c01241c0'
#export SPOTIPY_REDIRECT_URI='your-app-redirect-url'
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
        export MOZ_ENABLE_WAYLAND=1
fi
export BW_SESSION="mSYnbrcY5p5c+YbA+mrPTihv3ttahjHFnUF1hGkF0SwhTLrxkNIbQdWhTLu9WvNbfz8Yi96ReJuRZ4nYPqeqYw=="
