include:
  - fail2ban.installed

fail2ban.service:
  service.running:
    - enable: True
    - require:
      - pkg: fail2ban.packages
      - file: /etc/fail2ban/jail.local
      - file: /etc/fail2ban
    - watch:
      - file: /etc/fail2ban/jail.local

/etc/fail2ban/jail.local:
  file.managed:
    - source: salt://fail2ban/files/jail.local
    - user: root
    - group: root
    - dir_mode: 775
    - file_mode: 744
    - include_empty: True
    - require:
      - pkg: fail2ban.packages

/etc/fail2ban:
  file.recurse:
    - source: salt://fail2ban/files
    - user: root
    - group: root
    - dir_mode: 775
    - file_mode: 744
    - include_empty: True
    - require:
      - pkg: fail2ban.packages
