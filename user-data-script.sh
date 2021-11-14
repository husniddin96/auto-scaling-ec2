#!/bin/bash -ex

#output user data logs into a separate file for debugging
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

#download nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

#source nvm   
. /.nvm/nvm.sh

#install node
nvm install node

#export NVM dir
export NVM_DIR="/.nvm"
[ -s "$NVM/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM/bash_compeletion" ] && \. "$NVM_DIR/bash_compeletion"

#upgrade yum
sudo yum upgrade

#install git
sudo yum install git -y

cd /home/ec2-user

#get source from github repo
git clone https://github.com/husniddin96/auto-scaling-ec2.git

#get in project dir
cd auto-scaling-ec2

#give permissions
sudo chmod -R 755 .

#install packages
npm i

#start the app
node app.js > app.out.log 2> app.err.log < /dev/null &