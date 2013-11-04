Vagrant CakePHP installation
============================

A simple LAMP stack virtual machine with a pre-configured CakePHP installation.
Get a clean, isolated development environment for your project setup in seconds.

+ CakePHP 2.4.1
+ PHP 5.5 (PPA: zanfur/php5.5)
+ Apache 2.2
+ Ubuntu 12.04 LTS (precise64)
+ MySQL 5.5.32

Requirements
--------------
+ [VirtualBox](https://www.virtualbox.org/wiki/Downloads) with a host only network `192.168.5.1` with netmask `255.255.255.0` (192.168.5.0/24).
If you need help with this, follow step 1 and 2 from [this guide](http://christophermaier.name/blog/2010/09/01/host-only-networking-with-virtualbox).
+ [Vagrant 1.3+](http://www.vagrantup.com)
+ [Salty Vagrant plugin](https://github.com/saltstack/salty-vagrant) (`vagrant plugin install vagrant-salt`)

Usage
--------------
1. Install VirtualBox, Vagrant and the Salty Vagrant plugin.
2. Clone this repo, CD into the folder, remove the existing git repo:
```
    git clone git://github.com/ronalddddd/vagrant_cake.git && rm -rf vagrant_cake/.git && cd vagrant_cake
```
3. Boot the VM:
```
    vagrant up
```
4. Done. Start coding! The host's `www` directory is shared with the VM's `/var/www` directory, where the cake installation lives.


Suspend, Resume, Destroy
-------------------------
To suspend the VM, keeping all states intact (aka hibernate), use the command `vagrant suspend`. *** To bring it back up, use `vagrant resume`.***
Do not use `vagrant up`, as this will cause the www folder to be remounted with the wrong permissions.

When you're done with the VM and no longer want to keep the VM states (the VM's virtual disk), use `vagrant destroy` to remove the instance.
Your shared folder (`www`) will remain untouched.

IP Address
--------------
You can browse to the cake installation at `http://192.168.5.2`.
You can change this address in `/Vagrantfile` before calling `vagrant up`

To setup the network on virtualbox, follow step 1 and 2 from [this guide](http://christophermaier.name/blog/2010/09/01/host-only-networking-with-virtualbox).

Port forwarding
----------------
If you need to access the VM's web port from the host machine's IP, you can uncomment the line `#config.vm.network "forwarded_port", guest: 80, host: 8080` in `/Vagrantfile`.
This will create a host:8080 port forward to you your VM's port 80. Feel free to change/add port forwards.

Database
--------------
+ Database dump will be imported from [project path]/database.sql when the vagrant instance is created.
+ Default database is named `dev_app`. MySQL user `cake_user` has been granted all privileges to that DB.

Crontab
--------------
The `/salt/roots/crontabs.sls` config file manages which crontab template to use (and what user to run as) when setting up the VM.
A default template is provided in `/salt/roots/crontabs/www-data.cron`, which runs as the apache daemon user "www-data".

User credentials
-----------------
Below is a list of user credentials for this vm:

+ SSH: vagrant/vagrant
+ MySQL root: root/[null]
+ MySQL cake user: cake_user/[null]

Todos:
-----------------
+ clean up salt states
+ add staging/production salt configurations