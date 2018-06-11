#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

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

#install unzip
sudo apt-get install unzip

# install Git
cd /opt
sudo apt-get update -y
sudo apt-get install -y git

# install Nginx
cd /opt
sudo apt-get update -y
sudo apt-get install -y nginx

# install jenkins
apt-get update -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins
# make sure jenkins is started
cd /etc/init.d
sudo ./jenkins start

# install SonarQube
cd /opt
sudo wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.4.zip
sudo unzip sonarqube-6.4.zip
sudo mv sonarqube-6.4 SonarQube
cd SonarQube/bin/linux-x86-64
sudo ./sonar.sh start

# install SonarRunner
cd /opt
sudo wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip
sudo unzip sonar-runner-dist-2.4.zip
mv sonar-runner-2.4 SonarRunner

# install Ansible
cd /opt
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible
