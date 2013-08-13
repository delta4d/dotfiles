#!/usr/bin/env bash

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# slim
DEFAULT_SEESION="ck-launch-session dbus-launch --sh-syntax --exit-with-session openbox-session"

case $1 in
	openbox) exec $DEFAULT_SEESION;;
	*) exec $DEFAULT_SEESION;;
esac
