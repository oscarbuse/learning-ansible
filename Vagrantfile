# -*- mode: ruby -*-
# vi: set ft=ruby :

NUM_SERVERS = 2

Vagrant.configure('2') do |config|
  (1..NUM_SERVERS).each do |n|
    config.vm.define "ans#{n}" do |server|
      server.vm.box = 'bento/ubuntu-19.10'
      server.vm.hostname = "ans#{n}"

      server.vm.network 'private_network', ip: "192.168.66.6#{n}"

      server.vm.provider 'virtualbox' do |vb|
        vb.memory = '1024'
      end
      server.vm.provision :shell, path: "bootstrap#{n}.sh"
    end
  end
end

