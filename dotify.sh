while read server
do
  ssh -t $server /bin/bash << EOF
    if [ -d dotfiles ] ; then
      git pull
    else
      git clone https://github.com/h43z/dotfiles
    fi
    cd dotfiles && ./setupserver.sh
EOF
done < /dev/stdin



