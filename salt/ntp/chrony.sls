include:
  - ntp.chrony-installed

chronyd.service:
  service.running:
    - enable: True
    - require:
      - pkg: chrony.packages
      - file: /etc/chrony.conf
    - watch:
      - file: /etc/chrony.conf

/etc/chrony.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://ntp/files/chrony.conf
    - require:
      - pkg: chrony.packages

synchronize_ntp:
  cmd.run:
    - name: ntpdate pool.ntp.org
  
