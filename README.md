## Dependencies
- [VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/)

## Install
git clone https://github.com/ssarl2/vagrant-ansible.git

## Run
- `vagrant_ansible$ vagrant up` (Assume that running in windows 10)
- Go to drink a cup of coffee (Wait until ubuntu20 virtual box is visualized)

## Vagrant
### Command
|Command|Description|
|:---|:---|
|vagrant init|create an example for provisioning|
|vagrant up|read vagrant files and run provisioning|
|vagrant halt|shut down the virtual machines covered by vagrant|
|vagrant destroy|remove the virtual machines managed by vagrant|
|vagrant ssh|enter the virtual machines managed by vagrant|
|vagrant provision|apply changed settings to the virtual machines managed by vagrant|
|vagrant status|check status of vagrant|
|vagrant suspend|sleep virtual machines|
|vagrant resume|wake virtual machines up|
|vagrant reload|reload the vagrant|

## Ansible
### Document links
- [list of all modules](https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html)

### Options
|Options|Full name|Description|
|:---:|:---:|:---:|
|-i|--inventory-file|choose nodes to be applied|
|-m|--module-name|modules using|
|-k|--ask-pass|set to ask for password|
||--list-hosts|check nodes to be applied|

### AD-HOC Command
|Module|Example|
|:---:|:---|
|ping|ansible all -m ping --list-hosts|
|shell|ansible all -m shell -a "ls" -k|
|user|ansible all -m user -a "name=someone" -k|
|yum|ansible all -m yum -a "name=httpd state=present" -k|
|copy|ansible all -m copy -a "src=index.html dest=/var/www/html/index.html" -k|
|service|ansible all -m service -a "name=httpd state=started" -k|
|lineinfile|ansible localhost -c local -m lineinfile -a "path=somefile.lst line=192.168.1.14"|

### Playbook Command
|Module|Description|
|:---|:---|
|name|sort of log or just dscription what's going on|
|hosts|choose hosts that you named it with '[', ']' like '[webserver]'|
|tasks|it can have some task queues that you want under 'tasks:' with modules|
|gather_facts||
|get_url|similar to 'curl' in bash command also permission can be added to the files immediately 'mode=0644'|
|service|similar to 'service' in bash command|
|git|similar to 'git' in bash command. It can be used with 'repo:' and 'dest:'|
|with_items|declare command of multiple lines with '{{ item }}'|
|blockinfile|stamp 'block' contents on the path what you declared It can be used with 'path:' and 'block:'|
|replace|replace contents. It can be used with 'path:', 'regexp:' and 'backup:'|
|mount|attach something(shared volumes) to somewhere(nodes)|

### Extra
|Command|Description|
|:---|:---|
|name=`package`|name of package you want install|
|state=present|install|
|state=absent|remove|
|state=started|service start|
|state=mounted|mount..|
|src=`path and name`|of files to send|
|dest=`path and name`|of files to receive|
|path=`path and name`|target for line|
|line=`contents`|add contents to path|
|repo=`git repository url`|where you want to point from git|

## Troubleshooting
Sometimes when booting virtualbox, it's stuck. do `vagrant destroy -f`, launch virtualbox on the host machine and `vagrant up` again. Double click running image or check setting and do nothing. See if it goes next steps.