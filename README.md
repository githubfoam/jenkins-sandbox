# jenkins-sandbox


  [![Build Status](https://travis-ci.com/githubfoam/jenkins-sandbox.svg?branch=master)](https://travis-ci.com/githubfoam/jenkins-sandbox)  


vagrant, packer template, travisci,ansible role
~~~~
del Vagrantfile
vagrant init --template Vagrantfile.erb 
vagrant up vg-compute-10

Browse
http://192.168.20.18:8080/



administrator password from ansible playbook output

TASK [print init password jenkins] *********************************************
ok: [vg-compute-10] => {
    "result.stdout": "fcb019a49b844983881cab76f47493d0"
}

PLAY RECAP *********************************************************************
vg-compute-10              : ok=24   changed=9    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

~~~~

Official Jenkins Docker
~~~~
>vagrant up vg-docker-11
>vagrant ssh vg-docker-11 (password:vagrant)

sudo docker version
sudo docker image prune --force
sudo docker pull jenkins/jenkins:lts-jdk11
sudo docker image ls
sudo docker run -d -p 8080:8080 --name jenkinsci jenkins/jenkins:lts-jdk11 
sudo docker exec $(docker ps -q) cat /var/jenkins_home/secrets/initialAdminPassword
sudo docker container ls
sudo docker container stop jenkinsci
sudo docker container prune --force

http://192.168.20.11:8080

Plugin list
Script Console(Groovy)
http://192.168.20.11:8080/script

Jenkins.instance.pluginManager.plugins.each{
  plugin ->
    println ("${plugin.getShortName()}")
}
~~~~
Dockerfile build
~~~~
cd /vagrant/dockerfiles
sudo docker image prune --force
sudo docker build -t jenkinsci:latest . --file /vagrant/dockerfiles/Dockerfile.plugins
sudo docker image ls
sudo docker run -d -p 8080:8080 --name jenkinsci jenkinsci:latest
sudo docker exec $(docker ps -q) cat /var/jenkins_home/secrets/initialAdminPassword
sudo docker container ls
sudo docker container stop jenkinsci
sudo docker container prune --force
~~~~

~~~~
https://www.jenkins.io/
Official Jenkins Docker image
https://hub.docker.com/_/jenkins
~~~~