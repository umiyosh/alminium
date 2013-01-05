#!/bin/sh

if [ -e inst-script/$OS/jenkins-install ]
then
  echo "Jenkinsをインストールしますか?[y/N]"
  read ENABLE_JENKINS
  if [ "$ENABLE_JENKINS" = "y" ]
  then
    source inst-script/$OS/jenkins-install
  fi  
fi
exit