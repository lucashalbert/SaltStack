include:
  - snmp.installed

backup_original_snmpd_conf:
  cmd.run:
    - name: mv /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.original

/etc/snmp/snmpd.conf:
  file.managed:
    - mode: 644
    - user: root
    - group: root
    - source: salt://dell-omsa/files/snmpd.conf
    - require:
      - pkg: snmp.packages

snmpd.service:
  service.running:
    - enable: True
    - require:
      - pkg: snmp.packages
      - file: /etc/snmp/snmpd.conf
    - watch:
      - file: /etc/snmp/snmpd.conf
