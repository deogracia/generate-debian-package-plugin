#!/usr/bin/env bash

jenkins_up(){
  local retry=1
  local cpt=0
  while [ $retry -ne 0  ]
  do
    echo "Checking Jenkins state"
    wget -q http://localhost:8080/jnlpJars/jenkins-cli.jar
    retry=$?
    ((cpt++))
    if [ $cpt -gt 24  ]
    then
      break
    fi
    sleep 5
  done

  echo "retry = $retry"
  echo "cpt   = $cpt"

  if [ $retry -ne 0 ]
  then
    echo "Jenkins is up"
  else
    echo "Maybe Jenkins didn't start... Timeout"
  fi
}

rm /etc/apt/sources.list
cp /vagrant/my_vagrant_provisionning/apt_sources.list /etc/apt/sources.list

apt-get clean
pushd /var/lib/apt/lists
rm * -rf
popd

apt-get update
apt-get dist-upgarde -y


apt-get install -y vim

wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

apt-get update
apt-get install jenkins -y

jenkins_up

java -jar jenkins-cli.jar -s http://localhost:8080 quiet-down
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin greenballs -deploy
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin jobconfighistory -deploy
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin ruby-runtime -deploy -restart

jenkins_up
cat /vagrant/my_vagrant_provisionning/jenkins-test-job_config.xml |java -jar jenkins-cli.jar -s http://localhost:8080 create-job test
