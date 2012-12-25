#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice


##################################################################

# ibus
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export PT_IM_MODULE="ibus"

# transparent, shadow
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
xcompmgr &

# start gnome setting for gnome programs
gnome-settings-daemon &


DEFAULT_SESSION=awesome

case $1 in
	awesome) exec awesome;;
	openbox) exec openbox;;
	*) exec $DEFAULT_SESSION;;
esac

export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
