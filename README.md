## learning-ansible
* learning ansible using two vagrant ubuntu boxes

## vagrant boxes
1. hostname: ans1: host with the ansible code
1. hostname ans2: target host.
   1. this host is made "ansible ready" (with the role "make-ansible-ready")
   1. gets some basic hardening (with the role "hardening")
   1. gets apache (with the role "geerlingguy.apache")
   1. acts as a simple example with basic authentication to demonstrate ansible vault (with the role web-config)

## usage
* clone this repo: git clone https://github.com/oscarbuse/learning-ansible.git
* create the vagrant boxes (ans1 and ans2): vagrant up
* login to ans1 with: vagrant ssh ans1
* become harry (sudo su - harry) (harry is the "ansible user and can login without password later on ans2)
* harry@ans1:~$ cd ansbile

Get the requirements:
```
  harry@ans1:~/ansible$ ansible-galaxy install -r requirements.yml
```
Run the ansible plays:
```
  harry@ans1:~/ansible$ ansible-playbook -vv -i hosts.inv -k -u vagrant plays/includes/make-ansible-ready.yml
```
   (the vagrant user password is "vagrant").
```
  harry@ans1:~/ansible$ ansible-playbook -i hosts.inv -l www1 plays/deploy.yml
```

For self-study: take a look at deploy.yml + the included .yml files add the roles in the dir roles.
