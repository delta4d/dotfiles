#!/usr/bin/env sh

home=/home/delta

# cursor
xsetroot -cursor_name left_ptr

# set font path
xset +fp /usr/share/fonts/custome
xset fp rehash

# set wallpaper
feh --bg-scale $home/picture/bg.jpg

# xcompmgr transparency
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

# mpd
#mpd

# input method
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="xim"
ibus-daemon -d -x

# slim chosing
DEFAULT_SESSION=openbox-session

case $1 in
	openbox) $home/bin/startopenbox;;
	monsterwm) $home/bin/startmonsterwm;;
	*) exec $DEFAULT_SESSION;;
esac
