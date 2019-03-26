include:
  - openldap
  - sssd
  - ssh.installed
  - ssh.client
  - ssh.server

sshd.service:
  service.running:
    - enable: True
    - require:
      - pkg: ssh.packages
      - file: /etc/ssh/sshd_config
    - watch:
      - file: /etc/ssh/sshd_config
      - file: /etc/ssh/banner
      - file: /etc/motd

/etc/ssh/banner:
  file.managed:
    - mode: 644
    - user: root
    - group: root
    - source: salt://ssh/files/banner

/etc/motd:
  file.managed:
    - mode: 644
    - user: root
    - group: root
    - source: salt://ssh/files/motd

/etc/ssh/ldap.conf:
  file.symlink:
    - target: /etc/openldap/ldap.conf
