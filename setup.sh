: ${DESTDIR:=$HOME/install/nfdump}

if ! type -a fpm &> /dev/null; then
  if  [ -x /opt/cybraics/bin/fpm ]; then
    PATH=$PATH:/opt/cybraics/bin
  fi
fi
