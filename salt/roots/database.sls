mysql:                 # ID declaration
  pkg:                  # state declaration
    - installed         # function declaration
    - name: mysql-server
  service:
    - running
    - name: mysql
    - require:
      - pkg: mysql

python-mysqldb:
  pkg:
    - installed
    - require:
      - pkg: mysql

