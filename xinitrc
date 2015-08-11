#!/bin/bssh
xrdb ~/.Xresources
eval $(ssh-agent)
xset r rate 200 60
xset mouse 0 0
xset b off

if egrep -iq 'touchpad' /proc/bus/input/devices; then
    synclient VertEdgeScroll=1 &
    synclient TapButton1=1 &
fi

test $(xrandr | grep -E 'LVDS1 connected' | wc -l) -ge 1 && setup=solo
test $(xrandr | grep -E 'LVDS1 connected|DP1 connected' | wc -l) -ge 2 && setup=home
test $(xrandr | grep -E 'LVDS1 connected|DP1 connected|VGA1 connected' | wc -l) -ge 3 && setup=work

case $setup in
  solo) ~/.screenlayout/solo.sh;;
  home) ~/.screenlayout/home.sh;;
  work) ~/.screenlayout/work.sh;;
esac

redshift -l 47:12 -r -t 6500:4500 &
nitrogen --restore &
xscreensaver -no-splash &
#thunar --daemon &
urxvtd -q -o -f &

wm=${1:-i3}
case $wm in
  openbox) exec openbox-session;;
  i3) exec i3;;
esac

