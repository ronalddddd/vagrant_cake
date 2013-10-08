# /srv/salt/top.sls
base:
  '*':
    - webserver
    - php
    - database
    - cakephp
    - dev
