# /srv/salt/top.sls
base:
  '*':
    - webserver
    - php
    - database
    - cakephp
    - crontabs
    - dev
