crontabs:
  cron.file:
      - name: salt://crontabs/www-data.cron
      - user: 'www-data'
      - require:
        - pkg: httpd