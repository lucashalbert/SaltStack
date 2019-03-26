/etc/ssh/ssh_config:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ssh/files/ssh_config
    - require:
      - pkg: ssh.packages
