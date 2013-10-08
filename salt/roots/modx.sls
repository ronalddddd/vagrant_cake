modx:
  #mysql_user.present:
    #- host: localhost
    #- password: foo.bar
    #- require:
       #- pkg: python-mysqldb

  #mysql_grants.present:
    #- grant: all privileges
    #- user: modx

  # Run MODX setup, then replace with a customized sql dump.
  cmd.run:
    - name: "cd /var/www/setup; sudo php --php-ini /etc/php5/apache2/php.ini /var/www/setup/index.php --installmode=new; mysql -uroot modx_modx < /vagrant/database.sql"
    - require:
      - pkg: php
      - pkg: php5-mysql
      - file.sed: php
      - service: httpd
      - service: mysql
