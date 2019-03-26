httpd-packages:
  pkg.installed:
    - pkgs:
      - httpd
      - httpd-tools

httpd:
  service:
    - running
    - enable: True
    - require:
      - pkg: httpd-packages
      - file: /etc/httpd/conf/httpd.conf
    - watch:
      - pkg: httpd-packages
      - file: /etc/httpd/conf/httpd.conf

/etc/httpd/conf/httpd.conf:
  file.append:
    - text:
      - IncludeOptional vhost.d/*.conf

/etc/httpd/vhost.d:
  file.recurse:
    - source: salt://webserver/files/vhost.d
    - template: jinja
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644

/var/www/html/catchall:
  file.recurse:
    - source: salt://webserver/files/html/catchall/
    - template: jinja
    - user: apache
    - group: apache
    - dir_mode: 750
    - file_mode: 640

systemctl restart httpd.service:
  cmd.run
