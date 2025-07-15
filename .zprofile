GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:/home/luis/.local/share/flatpak/exports/share'

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi

PATH=$PATH:/opt/miniconda3/bin
