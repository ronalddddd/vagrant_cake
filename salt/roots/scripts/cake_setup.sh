# Create the database, user and grant privs
mysql -u root -e 'create database dev_app; grant all privileges on dev_app.* to cake_user@localhost;'
mysql -u root -e 'create database test_app; grant all privileges on test_app.* to cake_user@localhost;'
mysql -uroot dev_app < /vagrant/database.sql
mysql -uroot test_app < /vagrant/database.sql

# Setup PHPUnit
apt-get remove phpunit
pear channel-discover pear.phpunit.de
pear channel-discover pear.symfony.com
pear channel-discover components.ez.no
pear update-channels
pear upgrade-all
pear install --alldeps phpunit/PHPUnit
pear install --force --alldeps phpunit/PHPUnit
