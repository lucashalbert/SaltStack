include:
  - systemd.installed

set systemd log-level:
  cmd:
    - run
    - name: systemd-analyze set-log-level notice

/etc/systemd/system.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://systemd/files/system.conf
