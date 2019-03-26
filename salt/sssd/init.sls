include:
  - sssd.installed
  - sssd.certs
  - sssd.authconfig
  - openldap


/etc/sssd/sssd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - source: salt://sssd/files/sssd.conf
    - template: jinja
    - require:
      - pkg: sssd.packages
      - file: /etc/pki/ca-trust/source/anchors/ca.domain.tld.crt
      - cmd: update_ca_trust
    - require_in:
      - cmd: authconfig_apply

sssd.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/sssd/sssd.conf
    - watch:
      - file: /etc/sssd/sssd.conf
