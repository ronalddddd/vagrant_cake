Vagrant CakePHP installation
============================

A simple LAMP stack VM with a pre-configured CakePHP installation.
Get a clean, isolated development environment for your project setup in seconds.

+ CakePHP 2.4.1
+ PHP 5.5 (PPA: zanfur/php5.5)
+ Apache 2.2
+ Ubuntu 12.04 LTS (precise64)
+ MySQL 5.5.32

Requirements
--------------
+ VirtualBox with a host only adapter configured `192.168.5.1` with netmask `255.255.255.0`
+ [Vagrant 1.3+](http://www.vagrantup.com)
+ [Salty Vagrant plugin](https://github.com/saltstack/salty-vagrant) (`vagrant plugin install vagrant-salt`)

Usage
--------------
1. Install VirtualBox, Vagrant and the Salty Vagrant plugin.
2. Clone this repo.
3. CD into your working copy, execute command `vagrant up` and give it sometime to boot and provision the VM.
4. Start coding! The host's www directory is shared with the VM's /var/www directory, where the cake installation lives.

IP Address
--------------
You can browse to the cake installation at `http://192.168.5.2`.

Database
--------------
+ Database dump will be imported from [project path]/database.sql when the vagrant instance is created.
+ Default database is named `dev_app`. MySQL user `cake_user` has been granted all privileges to that DB.

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