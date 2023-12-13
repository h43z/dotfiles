xrdb ~/.Xresources
eval $(ssh-agent)
xset r rate 200 60
xset mouse 0 0
xset b off
xset s off
xset -dpms
xsetroot -solid "#666"
xrandr --dpi 140

# stop scrolling when fingers lifted from touchpad
synclient CoastingSpeed=0
# enable tapping
xinput set-prop "Synaptics TM3053-006" 318 3
# disable touchpad when keyboard is used
syndaemon -t -i 0.8 -d &

export $(dbus-launch)
exec i3
