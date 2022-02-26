#!/bin/bash


#Description: Sonarqube Server Installation

#Author: Fokam

#Date: February 2022

echo "Checking if looged in as a root user.."

if [$(USER) = root ]
then su - vagrant
else
echo "You are logged in as " $(USER)
fi

echo "Installing prerequisites for running SonarQube"

echo "Installing latest updates.."
sleep 2

sudo yum update -y

echo "Patching complete!"

echo "Installing OpenJDK 11..."
sleep 2

sudo yum install java-11-openjdk-devel -y

sudo yum install java-11-openjdk -y

echo "Downloading Sonarqube latest versions on your server..."

cd /opt

sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip


echo "Download complete!"

sleep 2

echo "Extracting packages..."

sudo yum install unzip -y 
sudo unzip /opt/sonarqube-9.3.0.51899.zip

echo "Changing ownership to the user and Switching to Linux binaries directory to start service..."
sleep 2
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start

echo "Now let's connect to SonarQube!"