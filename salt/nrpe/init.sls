include:
  - nagios
  - nrpe.installed
#  - sudo.nrpe

# enable and start nrpe
nrpe.service:
  service.running:
    - enable: True
    - watch:
      - pkg: nrpe.packages
      - file: /etc/nagios/nrpe.cfg
      - file: /etc/nrpe.d/*

# nrpe main configuration file
/etc/nagios/nrpe.cfg:
  file.managed:
    - source: salt://nrpe/files/nrpe.cfg
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nrpe.packages

# default nrpe checks
/etc/nrpe.d/defaults.cfg:
  file.managed:
    - source: salt://nrpe/files/nrpe.d/defaults.cfg
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nrpe.packages
