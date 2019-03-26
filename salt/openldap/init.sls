include:
  - openldap.installed

/etc/openldap/ldap.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://openldap/files/ldap.conf
    - template: jinja
    - require:
      - pkg: openldap.packages

/etc/nsswitch.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://openldap/files/nsswitch.conf
