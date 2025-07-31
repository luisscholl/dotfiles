xrdb -merge ~/.Xresources
if [[ "$(uname -n)" = "pc2328" ]]; then
  setxkbmap -option caps:swapescape
fi
