while read server
do
  ssh -t $server /bin/bash << EOF
    if [ -d dotfiles ] ; then
      cd dotfiles && git pull
    else
      git clone https://github.com/h43z/dotfiles && cd dotfiles
    fi
    ./setupserver.sh
EOF
done < /dev/stdin



