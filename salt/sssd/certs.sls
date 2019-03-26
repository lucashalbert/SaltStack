/etc/pki/ca-trust/source/anchors/ca.domain.tld.crt:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://sssd/files/ca.domain.tld.crt

update_ca_trust:
  cmd.run:
    - name: update-ca-trust extract
