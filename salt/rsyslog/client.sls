rsyslog.service:
  service.running:
    - enable: True
    - reload: False
    - require:
      - pkg: rsyslog.packages
      - file: /etc/rsyslog.conf
    - watch:
      - file: /etc/rsyslog.conf

/etc/rsyslog.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://rsyslog/files/rsyslog.conf
