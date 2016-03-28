[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
xset s off
xset -dpms
#/usr/lib/systemd/systemd --user
