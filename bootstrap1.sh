#!/usr/bin/env bash

PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin
export PATH

apt -y update
apt -y dist-upgrade
apt install -y ansible
apt install -y sshpass
apt install -y lynx
echo "192.168.66.62 ans2" >> /etc/hosts
if [ ! -d /home/harry ];then
  useradd -m -s /bin/bash harry
fi
rm -rf /home/harry/.ssh
sudo -u harry ssh-keygen -b 2048 -t rsa -f /home/harry/.ssh/id_rsa -q -N ""
if [ -d /home/harry/ansible ];then
  rm -rf /home/harry/ansible
fi
mkdir /home/harry/ansible
tar zxf /vagrant/ans1.tgz -C /home/harry/ansible
echo "qwerty" > /home/harry/.vault
chown -R harry.harry /home/harry
echo done

