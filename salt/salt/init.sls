include:
  - yum.salt-repo
  - salt.installed

salt-minion.service:
  service.running:
    - enable: True
    - require:
      - pkg: salt-minion.packages
      - file: /etc/salt/minion
    - watch:
      - file: /etc/salt/minion

/etc/salt/minion:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://salt/files/minion
    - require:
      - pkg: salt-minion.packages

