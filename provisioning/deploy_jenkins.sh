#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "=======================================================================deploy jenkins======================================================================="
VAGRANT_HOST_DIR=/vagrant/provisioning/jenkins_dir

########################
# Jenkins & Java
########################
echo "Installing Jenkins and Java"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FCEF32E745F2C3D5 > /dev/null 2>&1
apt-get update > /dev/null 2>&1
apt-get -y install default-jdk jenkins > /dev/null 2>&1

echo "Installing Jenkins default user and config"
cp $VAGRANT_HOST_DIR/jenkinsconfig/config.xml /var/lib/jenkins/
mkdir -p /var/lib/jenkins/users/admin
cp $VAGRANT_HOST_DIR/jenkinsconfig/users/admin/config.xml /var/lib/jenkins/users/admin/
chown -R jenkins:jenkins /var/lib/jenkins/users/

########################
# Install Node & npm
########################
echo "Installing Node & npm"
curl -sL https://deb.nodesource.com/setup_6.x | -E bash -
apt-get -y install nodejs
apt-get -y install npm

########################
# Install Docker
########################
echo "Installing Docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce
systemctl enable docker
usermod -aG docker ${USER}
usermod -aG docker jenkins
usermod -aG docker ubuntu

########################
# Install nginx
########################
echo "Installing nginx"
apt-get -y install nginx > /dev/null 2>&1
service nginx start

########################
# Configuring nginx
########################
echo "Configuring nginx"
cd /etc/nginx/sites-available
rm default ../sites-enabled/default
cp $VAGRANT_HOST_DIR/jenkins /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/jenkins /etc/nginx/sites-enabled/
service nginx restart
service jenkins restart


