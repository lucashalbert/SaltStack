include:
  - bash.installed

/etc/bashrc:
  file.managed:
    - source: salt://bash/files/bashrc
    - mode: 644
    - user: root
    - group: root
    - require:
      - pkg: bash.packages
