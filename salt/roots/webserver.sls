httpd:
  pkg:
    - installed
    {% if grains['os'] == 'RedHat' or grains['os'] == 'Fedora' or grains['os'] == 'CentOS'%}
    - name: httpd
    {% elif grains['os'] == 'Debian' or grains['os'] == 'Ubuntu'%}
    - name: apache2
    {% elif grains['os'] == 'Gentoo' or grains['os'] == 'Arch' or grains['os'] == 'FreeBSD' %}
    - name: apache
    {% endif %}

  # Change default web root directory to one in shared vagrant directory
  #file.sed:
   # - name: /etc/apache2/sites-available/default
   # - before: /var/www
   # - after: /vagrant/www
   # - require:
    # - pkg: httpd

  # Enable htaccess overrides
  file.managed:
    - name: "/etc/apache2/sites-available/default"
    - source: salt://www.conf
    - user: root
    - group: root
    - mode: 0644
    - watch_in:
      - service: httpd
  
  # Enable mods
  {% for mod in ['rewrite'] %}
  cmd.run:
    - name: "a2enmod {{mod}}"
    - unless: test -f /etc/apache2/mods-enabled/{{mod}}.load
    - require:
      - pkg: httpd
    - watch_in:
      - service: httpd
  {% endfor %}

  service.running:
    #- running
    {% if grains['os'] == 'Debian' or grains['os'] == 'Ubuntu' or grains['os'] == 'Gentoo' %}
    - name: apache2
    {% endif %}
    - enable: True
    - reload: True
    - require:
      - pkg: httpd

date > /tmp/started_apache:
  cmd:
    - wait
    - watch:
      - service: httpd
