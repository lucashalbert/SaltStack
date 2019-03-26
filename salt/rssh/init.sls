include:
  - rssh.installed

# Manage rssh configuration
/etc/rssh.conf:
  file.managed:
    - source: salt://rssh/files/rssh.conf
    - user: root
    - group: root
    - mode: 644

# change group of /bin/rssh to transfer
/bin/rssh:
  file.managed:
    - group: 96800024
