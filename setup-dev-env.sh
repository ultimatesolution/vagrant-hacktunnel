#!/bin/sh

mkdir -p /vagrant/code
cd /vagrant/code
git clone https://github.com/devhq-io/hacktunnel-mockup.git
git clone -b dev https://github.com/devhq-io/hacktunnel.git
cd hacktunnel
test -e nats-server.conf || cp nats-server.conf.sample nats-server.conf
nohup gnatsd -c nats-server.conf &
nohup /home/vagrant/opt/redis-stable/src/redis-server &
cd /vagrant/code/
echo Now you can develop in following folders
echo    /vagrant/code/hacktunnel
echo    /vagrant/code/hacktunnel-mockup

