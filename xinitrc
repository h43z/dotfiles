xrdb ~/.Xresources
eval $(ssh-agent)
xset r rate 200 60
xset mouse 0 0
xset b off
xset s off
xset -dpms
xsetroot -solid "#666"
xrandr --dpi 140
synclient CoastingSpeed=0
redshift -l 47:12 -r -t 6500:4500 -b 1:0.7 &
clipmenud &
autocutsel &
autocutsel -s PRIMARY &
syndaemon -t -i 0.8 -d &
export $(dbus-launch)
exec i3
