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

