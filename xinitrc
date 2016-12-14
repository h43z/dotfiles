xrdb ~/.Xresources
eval $(ssh-agent)
xset r rate 200 60
xset mouse 0 0
xset b off
xset s off
xset -dpms
xsetroot -solid "#666"
synclient VertEdgeScroll=1
synclient TapButton1=1
redshift -l 47:12 -r -t 6500:4500 &
exec i3 

