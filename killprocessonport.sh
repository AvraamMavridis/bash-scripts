killport()
{
  if [ -z "$1" ]; then
    echo "Please specify a port"
  else
    PORTID=$(lsof -i tcp:$1 | awk 'NR==2{ print $2 }')
    if [ -z "$PORTID" ]; then
      echo "There is not a process running in the ${PORTID} port"
    else
      echo "Are you sure you want to kill the process with PID ${PORTID} (y/n) ?"
      read $REPLY
      if [[ $REPLY =~ ^[Yy]$ ]]; then
        kill -9 $PORTID
      else
      fi
    fi
  fi
}

alias kp=killport
