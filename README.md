### Download 
- [VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/)
- `yum install ansible -y` (Centos7)


## Vagrant
|-- HashiCorp<br>
|---|-- Vagrant<br>
|---|---|-- ...<br>
|---|-- ansible_env_ready.yml<br>
|---|-- Vagrantfile<br>

|Command|Description|
|:---|:---|
|vagrant init|create an example for provisioning|
|vagrant up|read vagrant files and run provisioning|
|vagrant halt|shut down the virtual machines covered by vagrant|
|vagrant destroy|remove the virtual machines managed by vagrant|
|vagrant ssh|enter the virtual machines managed by vagrant|
|vagrant provision|apply changed settings to the virtual machines managed by vagrant|

## Ansible
### set up example
`ansible all -m ping -k`
`vi /etc/ansible/hosts` or
```
echo "[webserver]" >> /etc/ansible/hosts
echo "192.168.1.10" >> /etc/ansible/hosts
```

### Options
|Options|Full name|Description|
|:---:|:---:|:---:|
|-i|--inventory-file|choose nodes to be applied|
|-m|--module-name|modules using|
|-k|--ask-pass|set to ask for password|
||--list-hosts|check nodes to be applied|

### Command
|Command|Example or AD-HOC usage|
|:---:|:---|
|ping|ansible all -m ping --list-hosts|
|shell|ansible all -m shell -a "ls" -k|
|user|ansible all -m user -a "name=someone" -k|
|yum|ansible all -m yum -a "name=httpd state=present" -k|
|copy|ansible all -m copy -a "src=index.html dest=/var/www/html/index.html" -k|
|service|ansible all -m service -a "name=httpd state=started" -k|
|lineinfile|ansible localhost -c local -m lineinfile -a "path=somefile.lst line=192.168.1.14"|

**Appendixes**
|Command|Description|
|:---|:---|
|name=`package`|name of package you want install|
|state=present|install|
|state=absent|remove|
|state=started|service start|
|src=`path and name`|of files to send|
|dest=`path and name`|of files to receive|
|path=`path and name`|target for line|
|line=`contents`|add contents to path|

### Playbook
