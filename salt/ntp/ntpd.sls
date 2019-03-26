include:
  - ntp.ntp-installed

ntpdi.service:
  service.running:
    - enable: True
    - require:
      pkg: ntp.packages
      - file: /etc/ntp.conf
    - watch:
      - file: /etc/ntp.conf

/etc/ntp.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://ntp/files/ntp.conf
    - require:
      - pkg: ntp.packages

synchronize_ntp:
  cmd.run:
    - name: ntpdate pool.ntp.org
