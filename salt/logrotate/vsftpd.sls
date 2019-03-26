/etc/logrotate.d/vsftpd:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://logrotate/files/vsftpd
    - require:
      - pkg: logrotate.packages
