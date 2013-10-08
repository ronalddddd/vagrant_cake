# Mount /var/www with vbox shared folder
dev:
  cmd.run:
    - name: 'umount /var/www; mount -t vboxsf -o uid=`id -u www-data`,gid=`id -g www-data`,dmode=775,fmode=775 /var/www /var/www'
    - require:
      - pkg: httpd
    #- require_in:
      #- service: httpd
