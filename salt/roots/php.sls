php:
  pkgrepo.managed:
    - name: php5
    #- ppa: ondrej/php5
    - ppa: zanfur/php5.5
  pkg:
    - installed
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' or grains['os'] == 'Gentoo' %}
    - name: php5
    {% endif %}
    - require:
      - pkg: httpd
      - pkgrepo.managed: php5
    - require_in:
      - service: httpd

  file.sed:
    - name: /etc/php5/apache2/php.ini
    - before: ';date.timezone ='
    - after: 'date.timezone = Asia/Hong_Kong'
    - require:
      - pkg: php
    - require_in:
      - service: httpd
  
  cmd.run:
    - name: "apache2ctl restart"
    - require:
      - file.sed: php

php5-mysql:
  pkg:
    - installed
    - require: 
      - pkg: mysql
      - pkg: php

php5-curl:
  pkg:
    - installed
    - require:
      - pkg: php

php-pear:
  pkg:
    - installed
    - require:
      - pkg: php