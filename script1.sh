#!/bin/sh


docker run -td -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock --name portainerOS portainer/portainer

docker run -td --name ubuntuOS ubuntu:latest

docker run -td -p 3001:8080   -v "/project/phpvolume:/home/coder/lamp" -v "/project/nodejs:/home/coder/nodejs" -v "/project/www:/home/coder/wamp"  -u "$(id -u):$(id -g)" --name vscode codercom/code-server:latest

sleep 3
echo "**********************************************************************"
docker cp vscode:/root/.config/code-server/config.yaml .


cat ./config.yaml
echo "***********************************************************************"
