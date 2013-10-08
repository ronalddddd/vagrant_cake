cakephp:
  mysql_user.present:
    - host: localhost
    - name: cake_user
    - allow_passwordless: True
    - require:
       - pkg: python-mysqldb
       - service: mysql

  # Other setup from script
  cmd.script:
    - source: salt://scripts/cake_setup.sh
    - require:
      - pkg: php
      - pkg: php5-mysql
      - pkg: php-pear
      - file.sed: php
      - service: httpd
      - service: mysql
      - mysql_user.present: cake_user
