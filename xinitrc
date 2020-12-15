xrdb ~/.Xresources
eval $(ssh-agent)
xset r rate 200 60
xset mouse 0 0
xset b off
xset s off
xset -dpms
xsetroot -solid "#666"
xrandr --dpi 140
#synclient VertEdgeScroll=1
synclient TapButton1=1
synclient PalmDetect=1
synclient CoastingSpeed=0
redshift -l 47:12 -r -t 6500:4500 &
clipmenud &
autocutsel &
autocutsel -s PRIMARY &
#systemctl --user import-environment DISPLAY &
#dunst &
exec i3 
