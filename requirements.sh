#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

#install unzip
sudo apt-get install unzip

# install python
sudo apt-get update -y
sudo apt-get install -y python3
sudo apt-get install -y python-lxml
sudo apt-get install -y python-jenkins

# install JAVA
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# set JAVA_HOME
sudo chown ubuntu /etc/environment
sudo echo JAVA_HOME="/usr/lib/jvm/java-8-oracle/jre" >> /etc/environment
source /etc/environment
sudo chown root /etc/environment

# install awscli
sudo curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py --user
sudo export PATH=~/.local/bin:$PATH
sudo source ~/.profile
sudo pip install -y awscli --upgrade --user
sudo apt install -y awscli

#install npm
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
npm install -g @angular/cli@latest
sudo apt-get update
sudo apt-get install - y ghostscript
sudo apt-get install -y imagemagick
