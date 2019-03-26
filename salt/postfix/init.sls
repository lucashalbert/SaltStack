include:
  - postfix.installed

sendmail.service:
  service.dead:
    - enable: False


postfix.service:
  service.running:
    - enable: True
    - watch:
      - pkg: postfix.packages
      - file: /etc/postfix/main.cf

# postfix main configuration file
/etc/postfix/main.cf:
  file.managed:
    - source: salt://postfix/files/main.cf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: postfix.packages

systemctl restart postfix.service:
  cmd.run
