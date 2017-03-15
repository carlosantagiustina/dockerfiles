#!/bin/bash

confirm() {
    # call with a prompt string or use a default
    read -r -p "${1:-Delete container? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

docker run -d -p 3001:6666 -P --name cedar14phusion ckir/cedar14phusion

if [ $? -eq 0 ]
then
  xterm -maximized -xrm 'XTerm*selectToClipboard: true' -e "docker logs -f cedar14phusion ; sleep 1h" &
  docker exec -it cedar14phusion /bin/bash
  docker stop -t 30 cedar14phusion
  docker rm cedar14phusion
fi

